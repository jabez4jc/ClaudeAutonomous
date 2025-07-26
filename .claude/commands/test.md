# /test - Run Tests

Run comprehensive tests to ensure quality.

## What It Does

- Runs all test suites automatically
- Checks code coverage
- Validates security
- Measures performance

## Test Types

1. **Unit Tests**: Individual functions
2. **Integration Tests**: Component interactions  
3. **End-to-End Tests**: Complete user workflows
4. **Performance Tests**: Speed and load testing

## Quality Checks

- Test coverage >80%
- No security vulnerabilities
- Performance within limits
- Code style compliance

## Error Handling

- Automatic retry on flaky tests
- Clear failure reporting
- Suggests fixes for common issues
- Smart test isolation

## Integration

- Runs after `/build` automatically
- Uses test-specific ports to avoid conflicts
- Updates task status on completion

## Output

- Pass/fail status for all tests
- Coverage report
- Performance metrics
- Security scan results