# /plan-continue - Continue Task Planning

## Purpose
Continue generating detailed tasks from previous planning analysis summaries and add them to the backlog for development.

## Core Philosophy
**Ultra Think before you build and you won't break anything**

Continue the deep thinking process by expanding analysis summaries into actionable tasks.

## Process

### 1. Analysis Review
- Read existing analysis summaries from previous `/plan` sessions
- Review incomplete task breakdowns
- Identify areas needing detailed task creation

### 2. Task Generation from Summaries
- Convert analysis summaries into specific, actionable tasks
- Break down complex features into <4 hour tasks
- Maintain consistency with existing task format
- Ensure dependency tracking between tasks

### 3. Task Creation Pipeline
- Create detailed task files in `tasks/backlog/`
- Each task includes:
  - Clear description and context
  - Success criteria checklist
  - Technical implementation notes
  - Dependencies on other tasks
  - Estimated complexity/effort

### 4. Integration with Existing Workflow
- Update project status with new task counts
- Maintain task numbering sequence
- Link tasks to original analysis summaries
- Prepare tasks for `/auto` command pickup

## Task File Template
```markdown
# Task: [Task Name] (#[number])

## Description
What needs to be built and why. Reference to original analysis summary.

## Success Criteria
- [ ] Specific deliverable 1
- [ ] Specific deliverable 2
- [ ] Tests pass
- [ ] Documentation updated

## Technical Notes
Implementation approach and considerations.

## Dependencies
- Depends on: Task #X, Task #Y
- Blocks: Task #Z

## Analysis Reference
Originally identified in: [analysis summary reference]
```

## Expected Outcome
- All remaining tasks from analysis summaries are created as actionable items
- Tasks are properly organized in backlog with clear dependencies
- Ready for sequential development using `/auto` command
- Project maintains momentum without planning bottlenecks

## MCP Integration
- **Memory Bank**: Store task relationships and planning context
- **Sequential Thinking**: Maintain logical task ordering
- **Context7**: Reference framework documentation for technical tasks