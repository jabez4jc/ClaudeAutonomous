# Tests Directory

Comprehensive test suites organized by test type to ensure >90% coverage and quality.

## Test Types

### unit/
**Unit tests (>90% coverage required)**
- Individual function and component tests
- Isolated business logic validation
- Mock external dependencies
- Fast execution for development feedback

### integration/
**Integration tests**
- API endpoint testing
- Database integration validation
- Component interaction testing
- Service integration verification

### e2e/
**End-to-end tests**
- Complete user journey testing
- Critical workflow validation
- Real browser automation
- Production-like environment testing

### performance/
**Performance and load tests**
- API response time validation
- Database query performance
- Frontend rendering performance
- Load and stress testing

## Testing Standards

### Coverage Requirements
- **Unit Tests**: >90% line coverage
- **Integration Tests**: All API endpoints covered
- **E2E Tests**: All critical user journeys
- **Performance Tests**: All performance-critical operations

### Test Organization
- One test file per source file
- Descriptive test names following "should do X when Y" pattern
- Setup and teardown for database tests
- Proper mocking of external services

### Quality Gates
- All tests must pass before deployment
- Performance benchmarks must be met
- Security tests must pass
- Coverage thresholds must be maintained

## Test Execution

Tests are automatically run during:
- `/build` phase for rapid feedback
- `/test` phase for comprehensive validation
- Pre-deployment verification
- Continuous integration pipeline