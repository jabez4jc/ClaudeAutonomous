# /test - Quality Assurance Agent

Ensure quality through comprehensive testing and chaos engineering.

## Philosophy
"Ultra Think before you build" prevents most issues, but comprehensive testing ensures what we built matches spec and catches any remaining problems.

**Validate**: Functionality, security, performance, reliability, resilience

## Test Execution Order (Required Sequence)

### 1. Unit Tests (Run FIRST)
**Purpose**: Verify individual functions work correctly in isolation
**Command**: 
```bash
# Python
uv run pytest tests/unit/ -v --cov=src --cov-report=term-missing

# Node.js
pnpm test:unit
# or: npx jest tests/unit/

# Go
go test ./... -v -cover
```
**Success Criteria**: >90% code coverage, all tests pass
**If Fails**: Fix unit-level logic before proceeding

### 2. Integration Tests (Run SECOND)
**Purpose**: Verify components work together (APIs, databases, services)
**Command**:
```bash
# Python
uv run pytest tests/integration/ -v

# Node.js
pnpm test:integration
# or: npx jest tests/integration/

# Go
go test ./tests/integration/... -v
```
**Success Criteria**: >80% integration coverage, all API endpoints respond correctly
**If Fails**: Fix component interactions, database connections, API contracts

### 3. End-to-End Tests (Run THIRD)
**Purpose**: Verify complete user workflows work as expected
**Command**:
```bash
# Python with Playwright
uv run pytest tests/e2e/ -v
# or: uv run playwright test

# Node.js with Playwright
pnpm exec playwright test tests/e2e/
# or: npx cypress run --spec "tests/e2e/**/*"

# Go with Playwright (via Node.js)
npx playwright test tests/e2e/
```
**Success Criteria**: 100% critical user journeys pass, UI interactions work
**If Fails**: Fix user experience issues, frontend-backend integration

### 4. Performance Tests (Run FOURTH)
**Purpose**: Verify system meets performance requirements under load
**Command**:
```bash
# Python with Locust
uv run locust -f tests/performance/load_test.py --headless -u 50 -r 10 -t 60s

# Node.js with Artillery
pnpm exec artillery run tests/performance/load-test.yml

# Go with hey or similar
hey -n 1000 -c 10 http://localhost:8080/api/health
```
**Success Criteria**: Response times <200ms, handles expected load, no memory leaks
**If Fails**: Optimize queries, add caching, improve algorithms

### 5. Security Tests (Run FIFTH)
**Purpose**: Verify application is secure against common vulnerabilities
**Command**:
```bash
# Python - dependency scanning
uv run safety check
uv run bandit -r src/

# Node.js - dependency scanning  
pnpm audit
npx eslint-plugin-security

# General - OWASP ZAP, SQLMap for penetration testing
```
**Success Criteria**: No critical vulnerabilities, input validation works, auth secure
**If Fails**: Fix security issues before deployment

### 6. Chaos/Resilience Tests (Run LAST)
**Purpose**: Verify system gracefully handles failures and recovers automatically
**Command**:
```bash
# Python - simulate failures
uv run pytest tests/resilience/ -v

# Node.js - chaos testing
pnpm test:chaos

# Manual chaos testing
# - Kill services randomly
# - Simulate network partitions  
# - Exhaust system resources
```
**Success Criteria**: Auto-recovery works, graceful degradation, no data loss
**If Fails**: Implement circuit breakers, retry logic, health checks

## Test Categories by Purpose
**Functional**: Success criteria, happy path, edge cases, error states, integrations
**Security**: Input validation, injection prevention, auth/authz, data protection
**Performance**: Response times, resource usage, scalability, memory leaks, query optimization
**Chaos**: Service failures, network partitions, resource exhaustion, auto-recovery
**MCP Enhanced**: Puppeteer MCP for E2E testing, Database MCP for data integrity, GitHub MCP for CI/CD status, Context7 MCP for testing framework docs

## Comprehensive Test Run Command
```bash
# Python - Run all test types in sequence
uv run pytest tests/unit/ -v --cov=src
uv run pytest tests/integration/ -v  
uv run pytest tests/e2e/ -v
uv run locust -f tests/performance/load_test.py --headless -u 10 -r 2 -t 30s
uv run safety check && uv run bandit -r src/
uv run pytest tests/resilience/ -v

# Node.js - Run all test types in sequence
pnpm test:unit && pnpm test:integration && pnpm test:e2e
pnpm exec artillery run tests/performance/load-test.yml
pnpm audit && npx eslint-plugin-security src/
pnpm test:chaos
```

## Quality Gates (Must Pass in Order)
1. ✅ **Unit Tests**: >90% coverage, all pass
2. ✅ **Integration Tests**: >80% coverage, all endpoints work  
3. ✅ **E2E Tests**: 100% critical paths pass
4. ✅ **Performance Tests**: Meet response time/load requirements
5. ✅ **Security Tests**: No critical vulnerabilities
6. ✅ **Chaos Tests**: Auto-recovery and resilience verified
7. ✅ **Linting**: No code quality issues

## Resilience Patterns (Required)
Circuit breakers, retry logic, fallback mechanisms, health checks, resource limits, timeouts, error boundaries

## Next Steps Decision Tree
- **All Tests Pass** → `/ship` (deploy to production)
- **Unit Tests Fail** → `/build` (fix core logic)
- **Integration Tests Fail** → `/build` (fix component interactions)  
- **E2E Tests Fail** → `/build` (fix user workflows)
- **Performance Tests Fail** → `/build` (optimize performance)
- **Security Tests Fail** → `/build` (fix security issues)
- **Chaos Tests Fail** → `/build` (implement resilience patterns)
- **Unclear Test Requirements** → `/plan` (clarify testing criteria)

## Test Environment Management

### Automatic Test Server Cleanup
Before running any tests that require servers:

```bash
# Kill existing dev servers to prevent port conflicts during testing
lsof -ti:3100,8100,5532 | xargs kill -9 2>/dev/null || true  # Test ports
lsof -ti:3000,8000,5432 | xargs kill -9 2>/dev/null || true  # Dev ports
pkill -f "npm.*test\|pytest.*test\|jest" 2>/dev/null || true
```

### Test-Specific Port Strategy
- **Frontend tests**: Port 3100 (isolated from dev:3000)
- **Backend tests**: Port 8100 (isolated from dev:8000)  
- **Database tests**: Port 5532 (isolated from dev:5432)
- **Integration tests**: Use test-specific URLs and configurations

### Test Server Lifecycle
```bash
# For E2E and Integration tests that need running servers:

# 1. Start test backend (if needed)
cd backend && TEST_PORT=8100 uv run uvicorn main:app --port 8100 &
TEST_BACKEND_PID=$!

# 2. Wait for backend health
timeout 30 bash -c 'until curl -f http://localhost:8100/health; do sleep 1; done'

# 3. Start test frontend (if needed)  
cd frontend && REACT_APP_API_URL=http://localhost:8100 PORT=3100 npm start &
TEST_FRONTEND_PID=$!

# 4. Run tests
npm run test:e2e -- --baseURL=http://localhost:3100

# 5. Cleanup test servers
kill $TEST_BACKEND_PID $TEST_FRONTEND_PID 2>/dev/null || true
```

## Automated Test Pipeline
The AI agent should run tests automatically in the following sequence without human intervention:

1. **Setup test environment and dependencies**
   - Clean up existing test processes and ports
   - Start required test servers on isolated ports
   - Verify test server health before proceeding

2. **Execute all test categories in order** (unit → integration → e2e → performance → security → chaos)
   - Use test-specific configurations and ports
   - Maintain isolation between test types
   - Clean up between test category transitions

3. **Generate comprehensive test report with coverage metrics**
   - Include server startup/shutdown logs
   - Report port usage and conflicts (if any)
   - Provide detailed failure analysis with server states

4. **Auto-retry failed tests once with different conditions**
   - Retry with fresh server instances
   - Use alternative ports if conflicts detected
   - Clean environment completely between retries

5. **Complete cleanup after all tests**
   - Stop all test servers gracefully
   - Clean up test ports and processes
   - Remove temporary test files and configurations

6. **Decision point**
   - Only proceed to `/ship` if ALL test categories pass
   - If tests fail after retry, provide detailed failure analysis including server logs and return to `/build`