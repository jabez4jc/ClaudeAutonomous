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

### Default Port Configuration
```json
{
  "frontend": {
    "port": 3000,
    "fallback_ports": [3001, 3002, 3003]
  },
  "backend": {
    "port": 8000, 
    "fallback_ports": [8001, 8002, 8003]
  },
  "database": {
    "port": 5432,
    "fallback_ports": [5433, 5434, 5435]
  },
  "redis": {
    "port": 6379,
    "fallback_ports": [6380, 6381, 6382]
  }
}
```

## Project Type Detection

The AI automatically detects project structure and starts appropriate servers:

### Full-Stack Web App
```bash
# Detected: package.json + requirements.txt (or similar backend)
/dev start
# Starts:
# - Frontend: npm run dev (port 3000)
# - Backend: uv run uvicorn main:app --reload (port 8000)  
# - Database: docker-compose up postgres (port 5432)
```

### Next.js + API Routes
```bash
# Detected: next.config.js with API routes
/dev start  
# Starts:
# - Next.js: npm run dev (port 3000) - handles both frontend and API
# - Database: docker-compose up postgres (port 5432)
```

### React + Express/FastAPI
```bash
# Detected: client/ and server/ directories
/dev start
# Starts:
# - React: cd client && npm start (port 3000)
# - Express: cd server && npm run dev (port 8000)
# - Database: docker-compose up (port 5432)
```

### Microservices
```bash
# Detected: services/ directory with multiple apps
/dev start
# Starts all services defined in docker-compose.yml or detected directories
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

### Port Conflict Resolution
```bash
# Check if port is in use
lsof -ti:3000 && echo "Port 3000 in use" || echo "Port 3000 available"

# Kill specific port processes
lsof -ti:3000 | xargs kill -9 2>/dev/null || true
lsof -ti:8000 | xargs kill -9 2>/dev/null || true
```

### Startup Sequence
1. **Stop all existing dev processes**
2. **Clean up ports** (kill processes on target ports)
3. **Start database/services** (if needed)
4. **Wait for database ready** (health check)
5. **Start backend** (with health check endpoint)
6. **Wait for backend ready** (API health check)
7. **Start frontend** (configured to proxy to backend)
8. **Verify all services** are responding

## Implementation by Project Type

### Python Backend + React Frontend
```bash
# Auto-cleanup and start sequence
/dev start

# AI executes:
# 1. Cleanup
lsof -ti:3000,8000 | xargs kill -9 2>/dev/null || true

# 2. Start backend first
cd backend && uv run uvicorn main:app --reload --host 0.0.0.0 --port 8000 &
BACKEND_PID=$!

# 3. Wait for backend health  
timeout 30 bash -c 'until curl -f http://localhost:8000/health; do sleep 1; done'

# 4. Start frontend with proxy config
cd frontend && REACT_APP_API_URL=http://localhost:8000 npm start &
FRONTEND_PID=$!

# 5. Store PIDs for cleanup
echo "$BACKEND_PID,$FRONTEND_PID" > .claude/dev-pids.txt
```

### Node.js Full-Stack
```bash
# AI executes:
# 1. Cleanup existing processes
lsof -ti:3000 | xargs kill -9 2>/dev/null || true

# 2. Start with concurrently (install if needed)
npx concurrently \
  "cd client && npm start" \
  "cd server && npm run dev" \
  --prefix "{name}" \
  --names "frontend,backend" \
  --kill-others-on-fail
```

### Next.js (Integrated)
```bash
# AI executes:
# 1. Cleanup
lsof -ti:3000 | xargs kill -9 2>/dev/null || true

# 2. Start Next.js (handles both frontend and API)
npm run dev &
echo $! > .claude/dev-pids.txt
```

## Health Checks & Monitoring

### Automatic Health Verification
```bash
# Backend health check
curl -f http://localhost:8000/health || curl -f http://localhost:8000/api/health

# Frontend health check  
curl -f http://localhost:3000 && curl -f http://localhost:3000/api/health

# Database health check
pg_isready -h localhost -p 5432 || docker exec postgres pg_isready
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
# Output:
# ✅ Frontend: Running on http://localhost:3000 (PID: 12345)
# ✅ Backend:  Running on http://localhost:8000 (PID: 12346)  
# ✅ Database: Running on localhost:5432 (Docker: postgres_dev)
# 🔗 Full App: http://localhost:3000
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
1. Detect project type and required services
2. Clean up any existing processes on target ports
3. Start services in correct order with health checks
4. Verify all services are accessible  
5. Display access URLs and status
6. Keep processes running until `/dev stop`

### `/dev stop`  
1. Read PIDs from stored files
2. Gracefully shutdown all services (SIGTERM)
3. Force kill after timeout (SIGKILL)
4. Clean up temporary files and ports
5. Confirm all processes stopped

### Integration with `/auto` modes
- **Interactive mode**: Automatically starts dev servers for frontend preview
- **Build phase**: Starts servers for testing implementation
- **Test phase**: Uses isolated test instances to avoid conflicts
- **Cleanup**: Always stops test servers after completion

This eliminates manual port management and provides a single command for full development environment setup.