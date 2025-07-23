# /auto - Autonomous Development Workflow

"Ultra Think before you build" - Execute complete lifecycle: Understand → Plan → Build → Test → Complete

## Usage
`/auto <task_description>`

## Workflow Phases

**🤔 Understand**: Analyze requirements, dependencies, risks, success criteria
**📋 Plan**: Break into subtasks, create dependency graph, define testing strategy
**🔨 Build**: Implement with TDD, auto-retry failures (3x), apply best practices
**🧪 Test**: Comprehensive validation - ensure built solution matches spec, catch remaining issues

## Key Features
- **Fully Autonomous**: Zero human intervention until completion
- **Intelligent Retry**: Auto-fixes common build/test failures
- **Quality Gates**: Enforces testing, security, performance standards
- **Alert System**: Notifies only when manual intervention required

## Examples
```
/auto Create REST API with user authentication
/auto Build task management app with real-time updates
/auto Create Python library with comprehensive testing
```

## Status Monitoring
```bash
cat ./.claude/workflow/current_task.json
tail -f ./.claude/logs/autonomous-workflow.log
```