# /dev - Development Server Management

Unified command to start, stop, and manage development servers for full-stack applications.

## Usage
- `/dev start` - Start all development servers (frontend + backend + services)
- `/dev stop` - Stop all running development servers  
- `/dev restart` - Stop all servers and start fresh
- `/dev status` - Show status of all development processes
- `/dev logs` - Show combined logs from all services

## Automatic Port Management

### Port Detection & Cleanup
Before starting any development server, the AI agent will:

1. **Scan for existing processes** on target ports
2. **Kill conflicting processes** automatically  
3. **Clean up zombie processes** from previous sessions
4. **Reserve ports** to prevent conflicts during startup

### App-Specific Port Configuration
Ports are determined from each app's `.env` file configuration:

#### Port Resolution Process
1. **Read .env Files**: Scan all application directories for `.env` files
2. **Extract Port Variables**: Identify port configurations (PORT, SERVER_PORT, API_PORT, etc.)
3. **Detect Conflicts**: Check if multiple apps request the same port
4. **Resolve Conflicts**: Assign consecutive ports when conflicts detected
5. **Update .env Files**: Modify .env files with resolved ports during build

#### Port Conflict Resolution
```bash
# Example: Two apps both want port 3000
App1/.env: PORT=3000          # Keeps original port
App2/.env: PORT=3000          # Auto-updated to PORT=3001

# Multiple conflicts resolved consecutively
App1/.env: PORT=8000          # Keeps original
App2/.env: PORT=8000          # Updated to PORT=8001  
App3/.env: PORT=8000          # Updated to PORT=8002
```

## Project Type Detection

The AI automatically detects project structure and starts appropriate servers:

### Full-Stack Web App
```bash
# Detected: package.json + requirements.txt (or similar backend)
/dev start
# Process:
# 1. Read frontend/.env: PORT=3000
# 2. Read backend/.env: SERVER_PORT=8000
# 3. Read docker-compose.yml: postgres port 5432
# 4. Check conflicts and resolve
# 5. Start services with resolved ports
```

### Next.js + API Routes  
```bash
# Detected: next.config.js with API routes
/dev start
# Process:
# 1. Read .env.local: PORT=3000
# 2. Read database config from .env: DATABASE_PORT=5432
# 3. Resolve any conflicts
# 4. Start with app-specific ports
```

### React + Express/FastAPI
```bash
# Detected: client/ and server/ directories
/dev start
# Process:
# 1. Read client/.env: PORT=3000
# 2. Read server/.env: PORT=8000  
# 3. Check for port conflicts between apps
# 4. Update .env files if conflicts found
# 5. Start each app with its assigned port
```

### Microservices
```bash
# Detected: services/ directory with multiple apps
/dev start
# Process:
# 1. Scan all service directories for .env files
# 2. Extract port configurations from each service
# 3. Resolve all port conflicts across services
# 4. Update .env files with resolved ports
# 5. Start services with unique ports
```

## Process Management

### Automatic Process Cleanup
```bash
# Before starting new servers, AI runs:
pkill -f "npm.*start\|npm.*dev"          # Kill Node.js dev servers
pkill -f "uvicorn\|gunicorn\|flask"      # Kill Python servers  
pkill -f "next dev\|vite\|webpack"       # Kill bundler processes
pkill -f "tailwind.*watch"               # Kill CSS watch processes

# Clean up zombie processes
ps aux | grep -E "(npm|node|python|uvicorn)" | grep -v grep | awk '{print $2}' | xargs kill -9 2>/dev/null || true
```

### App-Specific Port Management
```bash
# Dynamic port conflict resolution based on .env files
# Example implementation:

# 1. Discover all .env files and extract ports
find . -name ".env*" -exec grep -H "PORT\|_PORT" {} \;

# 2. Build port allocation map
declare -A PORT_MAP
PORT_MAP["frontend"]=$(grep "PORT=" frontend/.env | cut -d'=' -f2)
PORT_MAP["backend"]=$(grep "SERVER_PORT=" backend/.env | cut -d'=' -f2)

# 3. Resolve conflicts by updating .env files
if [[ ${PORT_MAP["frontend"]} == ${PORT_MAP["backend"]} ]]; then
    # Update backend to use next available port
    NEW_PORT=$((${PORT_MAP["backend"]} + 1))
    sed -i "s/SERVER_PORT=.*/SERVER_PORT=$NEW_PORT/" backend/.env
fi

# 4. Kill processes on app-specific ports only
for app in "${!PORT_MAP[@]}"; do
    lsof -ti:${PORT_MAP[$app]} | xargs kill -9 2>/dev/null || true
done
```

### Enhanced Startup Sequence
1. **Discover Apps**: Scan project structure for applications with .env files
2. **Read Port Configurations**: Extract port variables from all .env files
3. **Resolve Port Conflicts**: Update .env files to ensure unique ports
4. **Stop Existing Processes**: Kill processes on app-specific ports only
5. **Start Services in Order**: 
   - Database/external services first
   - Backend services with their assigned ports
   - Frontend services with their assigned ports
6. **Health Check Each Service**: Verify each app is running on its assigned port
7. **Update Proxy Configurations**: Configure frontend proxies to use resolved backend ports

## Implementation by Project Type

### Python Backend + React Frontend
```bash
# App-specific port management and start sequence
/dev start

# AI executes:
# 1. Read port configurations
FRONTEND_PORT=$(grep "PORT=" frontend/.env | cut -d'=' -f2 || echo "3000")
BACKEND_PORT=$(grep "SERVER_PORT=" backend/.env | cut -d'=' -f2 || echo "8000")

# 2. Resolve port conflicts
if [[ $FRONTEND_PORT == $BACKEND_PORT ]]; then
    BACKEND_PORT=$((BACKEND_PORT + 1))
    sed -i "s/SERVER_PORT=.*/SERVER_PORT=$BACKEND_PORT/" backend/.env
fi

# 3. Cleanup app-specific ports
lsof -ti:$FRONTEND_PORT,$BACKEND_PORT | xargs kill -9 2>/dev/null || true

# 4. Start backend with its assigned port
cd backend && uv run uvicorn main:app --reload --host 0.0.0.0 --port $BACKEND_PORT &
BACKEND_PID=$!

# 5. Wait for backend health on assigned port
timeout 30 bash -c "until curl -f http://localhost:$BACKEND_PORT/health; do sleep 1; done"

# 6. Update frontend .env with backend port and start
echo "REACT_APP_API_URL=http://localhost:$BACKEND_PORT" >> frontend/.env
cd frontend && npm start &
FRONTEND_PID=$!

# 7. Store PIDs with port mapping
echo "$BACKEND_PID:$BACKEND_PORT,$FRONTEND_PID:$FRONTEND_PORT" > .claude/dev-pids.txt
```

### Node.js Full-Stack
```bash
# AI executes:
# 1. Read app-specific ports
CLIENT_PORT=$(grep "PORT=" client/.env | cut -d'=' -f2 || echo "3000")
SERVER_PORT=$(grep "PORT=" server/.env | cut -d'=' -f2 || echo "8000")

# 2. Resolve conflicts
if [[ $CLIENT_PORT == $SERVER_PORT ]]; then
    SERVER_PORT=$((SERVER_PORT + 1))
    sed -i "s/PORT=.*/PORT=$SERVER_PORT/" server/.env
fi

# 3. Cleanup app-specific ports
lsof -ti:$CLIENT_PORT,$SERVER_PORT | xargs kill -9 2>/dev/null || true

# 4. Start with resolved ports
npx concurrently \
  "cd client && PORT=$CLIENT_PORT npm start" \
  "cd server && PORT=$SERVER_PORT npm run dev" \
  --prefix "{name}" \
  --names "frontend,backend" \
  --kill-others-on-fail
```

### Next.js (Integrated)
```bash
# AI executes:
# 1. Read Next.js port configuration
NEXT_PORT=$(grep "PORT=" .env.local | cut -d'=' -f2 || echo "3000")

# 2. Cleanup app-specific port only  
lsof -ti:$NEXT_PORT | xargs kill -9 2>/dev/null || true

# 3. Start Next.js on its configured port
PORT=$NEXT_PORT npm run dev &
echo "$!:$NEXT_PORT" > .claude/dev-pids.txt
```

## Health Checks & Monitoring

### App-Specific Health Verification
```bash
# Dynamic health checks based on .env port configurations

# Backend health check using resolved port
BACKEND_PORT=$(grep "SERVER_PORT=" backend/.env | cut -d'=' -f2)
curl -f http://localhost:$BACKEND_PORT/health || curl -f http://localhost:$BACKEND_PORT/api/health

# Frontend health check using resolved port
FRONTEND_PORT=$(grep "PORT=" frontend/.env | cut -d'=' -f2) 
curl -f http://localhost:$FRONTEND_PORT

# Database health check using configured port
DB_PORT=$(grep "DATABASE_PORT=" .env | cut -d'=' -f2 || echo "5432")
pg_isready -h localhost -p $DB_PORT || docker exec postgres pg_isready
```

### Combined Logging
```bash
/dev logs
# Shows combined output from all services with timestamps and service labels
tail -f frontend.log backend.log database.log | awk '{print strftime("%H:%M:%S"), $0}'
```

## Integration with Testing

### Test-Safe Development
When running tests, the AI will:

1. **Check if dev servers are running** on test ports
2. **Start test-specific instances** on different ports if needed
3. **Use test environment variables** to avoid conflicts
4. **Clean up test processes** after completion

```bash
# Test mode with isolated ports
TEST_FRONTEND_PORT=3001 TEST_BACKEND_PORT=8001 /test
```

## Manual Control Commands

### Individual Service Control
```bash
/dev start frontend    # Start only frontend
/dev start backend     # Start only backend  
/dev stop frontend     # Stop only frontend
/dev restart backend   # Restart only backend
```

### Process Information  
```bash
/dev status
# Dynamic output based on app-specific ports:
# ✅ Frontend: Running on http://localhost:3001 (PID: 12345) [from frontend/.env]
# ✅ Backend:  Running on http://localhost:8002 (PID: 12346) [from backend/.env] 
# ✅ Database: Running on localhost:5433 (Docker: postgres_dev) [from .env]
# 🔗 Full App: http://localhost:3001 → http://localhost:8002
# 📝 Port Conflicts Resolved: backend 8000→8002, database 5432→5433
```

## Error Handling

### Common Issues & Auto-Fixes
- **Port conflicts**: Automatically kill and restart
- **Database not ready**: Wait with timeout and retry
- **Frontend proxy errors**: Verify backend health first
- **Permission errors**: Suggest solutions and retry
- **Dependency issues**: Auto-install missing packages

### Failure Recovery
```bash
# If any service fails to start:
1. Check logs for specific error
2. Apply common fixes (port cleanup, dependency install)
3. Retry with fallback configuration
4. Report specific issue if all attempts fail
```

## Expected Behavior

### `/dev start`
1. **Discover Applications**: Scan project for apps with .env files
2. **Read Port Configurations**: Extract port variables from all .env files
3. **Resolve Port Conflicts**: Update .env files to assign unique consecutive ports
4. **Clean Up App-Specific Ports**: Kill processes only on ports that will be used
5. **Start Services**: Launch each app with its assigned port from .env
6. **Health Check All Apps**: Verify each service running on correct port
7. **Display Port Mapping**: Show which apps are running on which ports
8. **Keep Running**: Maintain processes until `/dev stop`

### `/dev stop`
1. **Read App-Port Mapping**: Load PIDs and ports from `.claude/dev-pids.txt`
2. **Graceful Shutdown**: Send SIGTERM to each app process
3. **Force Kill After Timeout**: SIGKILL if processes don't stop gracefully
4. **Clean Up App-Specific Ports**: Only clean ports used by stopped apps
5. **Update .env Files**: Restore original port configurations if needed
6. **Confirm Shutdown**: Verify all app processes stopped

### Integration with Development Workflow
- **Build Phase**: Automatically starts servers using app-specific .env ports
- **Test Phase**: Uses separate test ports to avoid conflicts with development
- **Cleanup**: Stops only processes on app-specific ports after completion
- **Port Persistence**: Maintains resolved port configurations across sessions

## Key Benefits

- **App-Specific Port Management**: Each app runs on its configured port from .env
- **Automatic Conflict Resolution**: Consecutive ports assigned when conflicts detected
- **Zero Hardcoded Ports**: All port management based on app configuration files
- **Smart Cleanup**: Only processes on app-specific ports are managed
- **Configuration Updates**: .env files updated during build to resolve conflicts
- **Full Traceability**: Clear mapping of which app runs on which port