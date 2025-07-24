# Test Planning Guidelines

## When Tests Are Created and Run

### During `/plan` Phase
**Test Strategy Planning**: Define what types of tests are needed for each task
- Identify critical user journeys for E2E tests
- Define performance requirements and load testing scenarios
- Specify security requirements and attack vectors to test
- Plan integration points that need testing

### During `/build` Phase (Test Creation)
**Test-Driven Development**: Tests are created BEFORE and DURING implementation

#### Phase 1: Unit Tests (Red Phase)
- **When**: Immediately before implementing each function/method
- **Create**: `tests/unit/test_[module].py` or `tests/unit/[module].test.js`
- **Purpose**: Test individual functions in isolation
- **Coverage**: Every public function, edge cases, error conditions

#### Phase 2: Integration Tests (Green Phase)  
- **When**: As you implement API endpoints, database interactions, service connections
- **Create**: `tests/integration/test_api.py`, `tests/integration/test_database.py`
- **Purpose**: Test component interactions, API contracts, data flow
- **Coverage**: All API endpoints, database operations, external service calls

#### Phase 3: E2E Tests (Refactor Phase)
- **When**: After core functionality is complete, before moving to `/test` phase
- **Create**: `tests/e2e/test_user_workflows.py` or `tests/e2e/user-workflows.spec.js`
- **Purpose**: Test complete user journeys and system behavior
- **Coverage**: Critical user paths, authentication flows, data persistence

#### Phase 4: Performance Tests (Optimization Phase)
- **When**: After basic functionality works, during performance optimization
- **Create**: `tests/performance/load_test.py` or `tests/performance/load-test.yml`
- **Purpose**: Validate response times, resource usage, scalability
- **Coverage**: High-traffic endpoints, resource-intensive operations

### During `/test` Phase (Test Execution)
**Quality Assurance**: All tests are executed in specific order

1. **Unit Tests** → Fix logic issues
2. **Integration Tests** → Fix component interactions  
3. **E2E Tests** → Fix user experience issues
4. **Performance Tests** → Optimize performance
5. **Security Tests** → Fix vulnerabilities
6. **Chaos Tests** → Implement resilience

## Test Planning by Task Type

### API Endpoint Tasks
```markdown
# Task: Create user authentication endpoint

## Test Strategy
- **Unit Tests**: JWT generation, password hashing, input validation
- **Integration Tests**: Database user lookup, session management
- **E2E Tests**: Login flow, session persistence, logout
- **Performance Tests**: Concurrent login attempts, token validation speed
- **Security Tests**: SQL injection, brute force protection, token security
```

### Database Operation Tasks
```markdown
# Task: Implement user data repository

## Test Strategy  
- **Unit Tests**: Query builders, data mapping, validation
- **Integration Tests**: Database connections, transactions, migrations
- **E2E Tests**: Data persistence across user workflows
- **Performance Tests**: Query optimization, connection pooling
- **Security Tests**: SQL injection prevention, data encryption
```

### Frontend Component Tasks
```markdown
# Task: Create user profile component

## Test Strategy
- **Unit Tests**: Component rendering, prop handling, state management
- **Integration Tests**: API calls, form submissions, data loading
- **E2E Tests**: User interactions, navigation, form validation
- **Performance Tests**: Rendering performance, memory usage
- **Security Tests**: XSS prevention, input sanitization
```

### Background Job Tasks
```markdown
# Task: Implement email notification service

## Test Strategy
- **Unit Tests**: Email formatting, queue processing, retry logic
- **Integration Tests**: Email service API, database updates
- **E2E Tests**: End-to-end notification delivery
- **Performance Tests**: Queue throughput, memory usage
- **Security Tests**: Email injection prevention, rate limiting
```

## Required Test Files Structure

### Python Project
```
tests/
├── unit/
│   ├── test_auth.py              # Unit tests for auth module
│   ├── test_user_service.py      # Unit tests for user service
│   └── test_validators.py        # Unit tests for validation
├── integration/
│   ├── test_api.py               # API endpoint integration tests
│   ├── test_database.py          # Database integration tests
│   └── test_external_services.py # Third-party service tests
├── e2e/
│   ├── test_user_workflows.py    # Complete user journey tests
│   └── test_admin_workflows.py   # Admin functionality tests
├── performance/
│   ├── load_test.py              # Load testing with Locust
│   └── stress_test.py            # Stress testing scenarios
├── security/
│   ├── test_auth_security.py     # Authentication security tests
│   └── test_input_validation.py  # Input validation security tests
├── resilience/
│   ├── test_circuit_breakers.py  # Circuit breaker tests
│   └── test_recovery.py          # Auto-recovery tests
└── fixtures/
    ├── test_data.py              # Test data and fixtures
    └── mock_services.py          # Mock external services
```

### Node.js Project
```
tests/
├── unit/
│   ├── auth.test.js              # Unit tests for auth module
│   ├── userService.test.js       # Unit tests for user service
│   └── validators.test.js        # Unit tests for validation
├── integration/
│   ├── api.test.js               # API endpoint integration tests
│   ├── database.test.js          # Database integration tests
│   └── externalServices.test.js  # Third-party service tests
├── e2e/
│   ├── user-workflows.spec.js    # Complete user journey tests
│   └── admin-workflows.spec.js   # Admin functionality tests
├── performance/
│   ├── load-test.yml             # Load testing with Artillery
│   └── stress-test.js            # Stress testing scenarios
├── security/
│   ├── auth-security.test.js     # Authentication security tests
│   └── input-validation.test.js  # Input validation security tests
├── resilience/
│   ├── circuit-breakers.test.js  # Circuit breaker tests
│   └── recovery.test.js          # Auto-recovery tests
└── fixtures/
    ├── testData.js               # Test data and fixtures
    └── mockServices.js           # Mock external services
```

## Test Coverage Requirements

### Unit Tests
- **Coverage**: >90% line coverage, >85% branch coverage
- **Scope**: All public functions, edge cases, error conditions
- **Isolation**: No external dependencies (database, API calls, file system)

### Integration Tests  
- **Coverage**: >80% of integration points
- **Scope**: API endpoints, database operations, service interactions
- **Environment**: Test database, mock external services

### E2E Tests
- **Coverage**: 100% of critical user journeys
- **Scope**: Complete workflows, authentication, data persistence
- **Environment**: Full application stack, test data

### Performance Tests
- **Coverage**: All high-traffic endpoints, resource-intensive operations
- **Metrics**: Response time <200ms, throughput requirements, memory usage
- **Load**: Expected production traffic patterns

### Security Tests
- **Coverage**: All input points, authentication, authorization
- **Scope**: OWASP Top 10, dependency vulnerabilities, data protection
- **Tools**: Static analysis, dependency scanning, penetration testing

### Chaos/Resilience Tests
- **Coverage**: All failure scenarios, recovery mechanisms
- **Scope**: Service failures, network partitions, resource exhaustion
- **Verification**: Auto-recovery, graceful degradation, data consistency

## Automated Test Execution

### During `/build` Phase
```bash
# Run tests as you build (TDD cycle)
uv run pytest tests/unit/test_new_feature.py -v    # Red phase
# Implement feature
uv run pytest tests/unit/test_new_feature.py -v    # Green phase
# Refactor and add integration tests
uv run pytest tests/integration/ -v                # Integration tests
```

### During `/test` Phase  
```bash
# Complete test suite execution (automatic)
uv run pytest tests/unit/ -v --cov=src --cov-report=term-missing
uv run pytest tests/integration/ -v
uv run pytest tests/e2e/ -v
uv run locust -f tests/performance/load_test.py --headless -u 10 -r 2 -t 30s
uv run safety check && uv run bandit -r src/
uv run pytest tests/resilience/ -v
```

## Test Failure Handling

### Unit Test Failures
- **Action**: Return to `/build` phase
- **Focus**: Fix core logic, algorithms, data structures
- **Timeline**: Must be resolved before integration tests

### Integration Test Failures
- **Action**: Return to `/build` phase  
- **Focus**: Fix API contracts, database schemas, service connections
- **Timeline**: Must be resolved before E2E tests

### E2E Test Failures
- **Action**: Return to `/build` phase
- **Focus**: Fix user workflows, frontend-backend integration
- **Timeline**: Must be resolved before performance tests

### Performance Test Failures
- **Action**: Return to `/build` phase
- **Focus**: Optimize queries, add caching, improve algorithms
- **Timeline**: Must meet requirements before security tests

### Security Test Failures
- **Action**: Return to `/build` phase
- **Focus**: Fix vulnerabilities, improve input validation, secure auth
- **Timeline**: Must be resolved before deployment

### Chaos Test Failures
- **Action**: Return to `/build` phase
- **Focus**: Implement circuit breakers, retry logic, health checks
- **Timeline**: Must be resolved before production deployment

## Quality Gates

Each test type has specific quality gates that must be met:

1. **Unit Tests**: >90% coverage, all tests pass, fast execution (<30s)
2. **Integration Tests**: >80% coverage, all endpoints work, database operations succeed
3. **E2E Tests**: 100% critical paths pass, UI interactions work, data persists
4. **Performance Tests**: Response times <200ms, handles expected load, no memory leaks
5. **Security Tests**: No critical vulnerabilities, auth secure, inputs validated
6. **Chaos Tests**: Auto-recovery works, graceful degradation, no data loss

Only when ALL quality gates pass can the task proceed to `/ship` phase.

## AI Agent Testing Responsibilities

The AI agent must:
1. **Create comprehensive test suites** during `/build` phase
2. **Execute tests in proper order** during `/test` phase  
3. **Analyze test failures** and provide detailed reports
4. **Auto-retry failed tests** once with different conditions
5. **Return to `/build`** if tests fail after retry
6. **Generate test coverage reports** and metrics
7. **Validate performance benchmarks** meet requirements
8. **Verify security standards** are maintained
9. **Ensure resilience patterns** are properly implemented

The goal is **zero human intervention** in the testing process while maintaining the highest quality standards.