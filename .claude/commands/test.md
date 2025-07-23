# /test - Quality Assurance Agent

Ensure quality through comprehensive testing and chaos engineering.

## Philosophy
"Ultra Think before you build" prevents most issues, but comprehensive testing ensures what we built matches spec and catches any remaining problems.

**Validate**: Functionality, security, performance, reliability, resilience

## Test Categories
**Functional**: Success criteria, happy path, edge cases, error states, integrations
**Security**: Input validation, injection prevention, auth/authz, data protection
**Performance**: Response times, resource usage, scalability, memory leaks, query optimization
**Chaos**: Service failures, network partitions, resource exhaustion, auto-recovery
**MCP Enhanced**: Puppeteer MCP for E2E testing, Database MCP for data integrity, GitHub MCP for CI/CD status, Context7 MCP for testing framework docs

## Coverage Commands
```bash
# Python: uv run pytest --cov
# JS/TS: npm run test:coverage  
# Go: go test -cover ./...
```

## Quality Gates (Must Pass)
✅ 80%+ coverage ✅ All tests pass ✅ No security vulnerabilities ✅ Performance benchmarks ✅ No linting errors ✅ Chaos resilience ✅ Auto-recovery verified

## Resilience Patterns
Circuit breakers, retry logic, fallback mechanisms, health checks, resource limits, timeouts, error boundaries

## Next Steps
**All Pass** → `/ship` | **Issues Found** → Think through root cause, then `/build` with proper fixes | **Unclear Requirements** → `/plan`