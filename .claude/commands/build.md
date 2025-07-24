# /build - Implementation Agent

Implement solutions with craftsmanship: thoughtful, clear, tested, secure, elegant.

## Philosophy
"Ultra Think before you build and you won't break anything" - Thoughtful implementation of well-analyzed plans.

**Process**: Deep thinking → Test-first implementation → Validation → If fixes needed, think through root cause before implementing

## Test-Driven Development Process (Required)

### 1. Unit Tests (Create FIRST during build)
**When**: Immediately before implementing each function/method
**Location**: `tests/unit/`
**Purpose**: Test individual functions and classes in isolation

```bash
# Python
mkdir -p tests/unit
# Create tests/unit/test_[module_name].py for each source module
uv run pytest tests/unit/ -v

# Node.js
mkdir -p tests/unit  
# Create tests/unit/[module_name].test.js for each source module
npm run test:unit
```

### 2. Integration Tests (Create DURING build)
**When**: After implementing components that interact with each other
**Location**: `tests/integration/`
**Purpose**: Test API endpoints, database operations, service interactions

```bash
# Python - API endpoints, database queries
mkdir -p tests/integration
# Create tests/integration/test_api.py, test_database.py
uv run pytest tests/integration/ -v

# Node.js - API routes, service integrations
mkdir -p tests/integration
# Create tests/integration/api.test.js, database.test.js
npm run test:integration
```

### 3. End-to-End Tests (Create AFTER build completion)
**When**: After complete feature implementation, before /test phase
**Location**: `tests/e2e/`
**Purpose**: Test complete user workflows and system behavior

```bash
# Python with Playwright/Selenium
mkdir -p tests/e2e
# Create tests/e2e/test_user_workflows.py
uv add --dev playwright pytest-playwright
uv run pytest tests/e2e/ -v

# Node.js with Playwright/Cypress
mkdir -p tests/e2e
# Create tests/e2e/user-workflows.spec.js
pnpm add -D @playwright/test
pnpm exec playwright test
```

### 4. Performance Tests (Create AFTER core functionality)
**When**: After basic functionality works, during optimization phase
**Location**: `tests/performance/`
**Purpose**: Load testing, response time validation, resource usage

```bash
# Python with locust
mkdir -p tests/performance
# Create tests/performance/load_test.py
uv add --dev locust
uv run locust -f tests/performance/load_test.py

# Node.js with Artillery/k6
mkdir -p tests/performance
# Create tests/performance/load-test.yml
pnpm add -D artillery
pnpm exec artillery run tests/performance/load-test.yml
```

## Build Phase Test Creation Order

### Phase 1: Pre-Implementation (Red Phase)
1. **Create failing unit tests** for the functionality you're about to build
2. **Set up test structure** in `tests/unit/`
3. **Define test cases** based on task success criteria

### Phase 2: During Implementation (Green Phase)
1. **Implement minimal code** to make unit tests pass
2. **Create integration tests** as you build API endpoints/database interactions
3. **Add test fixtures and helpers** in `tests/fixtures/`

### Phase 3: Post-Implementation (Refactor Phase)
1. **Create E2E tests** for complete user workflows
2. **Add performance tests** for critical paths
3. **Implement chaos/resilience tests** in `tests/resilience/`

## Standards
**Code Quality**: Single responsibility, meaningful names, DRY, error handling, type safety
**Test Coverage**: >90% unit, >80% integration, 100% critical paths E2E
**Resilience**: Circuit breakers, retry logic, graceful degradation, timeouts, health checks
**Security**: Input validation, injection prevention, authentication, environment secrets
**MCP Integration**: File System MCP for structure, GitHub MCP for PRs, Database MCP for migrations, Context7 MCP for framework guidance

## Language Setup with Testing
**Python**: 
```bash
uv init && uv add fastapi sqlalchemy
uv add --dev pytest pytest-cov pytest-asyncio playwright locust
mkdir -p tests/{unit,integration,e2e,performance}
```

**JS/TS**: 
```bash
pnpm init && pnpm add express typescript
pnpm add -D jest @playwright/test artillery vitest
mkdir -p tests/{unit,integration,e2e,performance}
```

**Go**: 
```bash
go mod init && go get [packages]
mkdir -p tests/{unit,integration,e2e,performance}
# Go uses _test.go files alongside source code + separate test directories
```

## Kaizen Practice
With every commit: Fix small issue, improve docs, refactor unclear code, reduce complexity

## Development Server Management During Build

### Automatic Process Cleanup
Before starting any development servers during build phase:

```bash
# Kill existing dev servers to prevent port conflicts
lsof -ti:3000,8000,5432 | xargs kill -9 2>/dev/null || true
pkill -f "npm.*dev\|uvicorn\|flask\|gunicorn" 2>/dev/null || true

# Clean up zombie processes from previous sessions
ps aux | grep -E "(npm|node|python|uvicorn)" | grep -v grep | awk '{print $2}' | xargs kill -9 2>/dev/null || true
```

### Smart Server Startup
The AI agent will automatically:

1. **Detect project type** (React+FastAPI, Next.js, etc.)
2. **Clean up existing processes** on target ports
3. **Start servers in correct order** (backend first, then frontend)
4. **Verify health checks** before proceeding with development
5. **Store process IDs** for cleanup after build completion

### Integration with Testing
- **Frontend builds**: Automatically start dev server for live preview during interactive checkpoints
- **Backend builds**: Start API server for testing endpoints with curl/Postman
- **Full-stack builds**: Start both servers with proper proxy configuration
- **Cleanup**: Always stop dev servers after build phase completion

## Process Management Best Practices

### Port Assignment Strategy
- **Frontend**: 3000 (fallback: 3001, 3002, 3003)
- **Backend**: 8000 (fallback: 8001, 8002, 8003)  
- **Database**: 5432 (fallback: 5433, 5434, 5435)
- **Test instances**: +100 offset (3100, 8100, 5532)

### Health Check Requirements
```bash
# Backend health verification
timeout 30 bash -c 'until curl -f http://localhost:8000/health; do sleep 1; done'

# Frontend health verification  
timeout 30 bash -c 'until curl -f http://localhost:3000; do sleep 1; done'
```

### Cleanup After Build
```bash
# Read stored PIDs and gracefully shutdown
if [ -f .claude/dev-pids.txt ]; then
    cat .claude/dev-pids.txt | xargs kill -TERM 2>/dev/null || true
    sleep 2
    cat .claude/dev-pids.txt | xargs kill -9 2>/dev/null || true  
    rm .claude/dev-pids.txt
fi
```

## Check Current Task
```bash
ls tasks/in-progress/*.md 2>/dev/null || echo "Use /plan first"
```