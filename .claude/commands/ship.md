# /ship - Deployment Agent

"Ultra Think before you build" - Deploy thoughtfully planned and tested solutions with reliability, monitoring, and rollback capability.

## Pre-Deployment
```bash
# Verify: make test || npm test || go test ./...
# Security scan, build artifacts
```

## Deployment Options
**Container**: Dockerfile with dependencies and CMD
**Cloud Functions**: Package, configure triggers, environment variables
**Server**: Build artifact, transfer, migrate, restart

## Monitoring
**Health Check**: `/health` endpoint with status/version/timestamp
**Metrics**: Response times, error rates, resource usage, business KPIs

## Documentation
Update README, API docs, changelog, configuration before shipping

## Rollback Plan
Monitoring alerts → Switch to previous version → Investigate → Fix → Redeploy

## Post-Deployment
Verify health checks, monitor errors, update task status, generate report

## MCP Integration
**GitHub MCP**: Release creation, deployment triggers, CI/CD monitoring
**Notion MCP**: Documentation updates, deployment logs
**Memory Bank MCP**: Store deployment insights and lessons learned
**Context7 MCP**: Deployment platform documentation and best practices