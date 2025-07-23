# /auto - Autonomous Development Workflow

"Ultra Think before you build" - Execute complete lifecycle with automatic task progression and folder management.

## Usage
- `/auto` - Process next available task from backlog
- `/auto <task_description>` - Execute specific task
- `/auto --continuous` - Run continuously until all backlog tasks complete

## Autonomous Task Management

### 1. Task Discovery & Selection
- Automatically scan `tasks/backlog/` for next available task
- Respect task dependencies and priority ordering
- Load task details and success criteria

### 2. Task Lifecycle with Folder Management
**🔄 Task Progression**: `backlog/` → `in-progress/` → `testing/` → `completed/`

- **Start**: Move task from `tasks/backlog/` to `tasks/in-progress/`
- **Build Phase**: Keep in `in-progress/` during development
- **Testing**: Move to `tasks/testing/` when implementation complete
- **Complete**: Move to `tasks/completed/` when all criteria met

### 3. Workflow Phases
**🤔 Understand**: Analyze requirements, dependencies, risks, success criteria
**📋 Plan**: Break into subtasks, create dependency graph, define testing strategy  
**🔨 Build**: Implement with TDD, auto-retry failures (3x), apply best practices
**🧪 Test**: Comprehensive validation - ensure built solution matches spec, catch remaining issues
**✅ Complete**: Update status, move task file, proceed to next task

### 4. Continuous Operation
- After completing a task, automatically start next available task
- Handle task dependencies and blocking conditions
- Maintain project status tracking throughout
- Only pause for manual intervention when blocked

## Key Features
- **Fully Autonomous**: Zero human intervention until completion
- **Automatic Task Progression**: Moves tasks through folder states
- **Continuous Execution**: Processes entire backlog sequentially
- **Intelligent Retry**: Auto-fixes common build/test failures
- **Quality Gates**: Enforces testing, security, performance standards
- **Alert System**: Notifies only when manual intervention required

## Examples
```
/auto Create REST API with user authentication
/auto Build task management app with real-time updates
/auto Create Python library with comprehensive testing
```

## Implementation Details

### Task File Movement
```bash
# Automatic task progression handled by the AI agent:
mv tasks/backlog/task-001.md tasks/in-progress/
# ... development work ...
mv tasks/in-progress/task-001.md tasks/testing/
# ... testing and validation ...
mv tasks/testing/task-001.md tasks/completed/
```

### Continuous Processing Script
The workflow includes a helper script for continuous operation:
```bash
.claude/scripts/continuous-auto.sh --continuous
```

## Status Monitoring
```bash
cat ./.claude/project_status.json
tail -f ./.claude/logs/autonomous-workflow.log
find tasks/ -name "*.md" | sort
```

## Expected Behavior
1. **Single Task**: `/auto` processes one task completely then stops
2. **Continuous Mode**: `/auto --continuous` processes entire backlog sequentially  
3. **Task Movement**: Tasks automatically move through folder states
4. **Status Updates**: Project status updated after each task state change
5. **Dependency Handling**: Respects task dependencies and blocking conditions