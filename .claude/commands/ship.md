# /ship - Deploy to Production

Deploy completed features to production.

## What It Does

- Builds production assets
- Runs final quality checks
- Deploys to production environment
- Monitors deployment health

## Pre-Deployment Checks

- All tests passing
- Security scan clean
- Performance benchmarks met
- Documentation updated

## Deployment Process

1. **Build**: Create production assets
2. **Test**: Run final integration tests
3. **Deploy**: Push to production
4. **Verify**: Health checks and monitoring
5. **Rollback**: Automatic rollback if issues detected

## Monitoring

- Application health checks
- Performance monitoring
- Error tracking
- User experience metrics

## Rollback

- Automatic rollback on critical failures
- Manual rollback capability
- Database migration rollback
- Traffic switching

## Integration

- Runs after successful `/test`
- Updates deployment status
- Notifies team of deployment

## Output

- Deployment status
- Performance metrics
- Health check results
- Access URLs for deployed features