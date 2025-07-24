# /auto - Autonomous Development Workflow

"Ultra Think before you build" - Execute complete lifecycle with automatic task progression and folder management.

## Usage
- `/auto` - Process next available task from backlog with feedback checkpoints
- `/auto <task_description>` - Execute specific task with human feedback
- `/auto --continuous` - Run continuously until all backlog tasks complete (backend/API tasks)
- `/auto --interactive` - Interactive mode with frequent feedback checkpoints (frontend/UI tasks)
- `/auto --silent` - Fully autonomous mode with no human feedback (data processing/utility tasks)

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

### 3. Workflow Phases (with Human Feedback)

**🤔 Understand**: Analyze requirements, dependencies, risks, success criteria
- **Frontend Tasks**: Present wireframes/mockups interpretation → Get approval
- **All Tasks**: Show implementation approach → Get confirmation

**📋 Plan**: Break into subtasks, create dependency graph, define testing strategy  
- **Interactive Mode**: Present detailed implementation plan → Get feedback
- **Frontend Tasks**: Show component architecture and state management approach → Get approval

**🔨 Build**: Implement with TDD, auto-retry failures (3x), apply best practices
- **Checkpoint 1**: After core functionality → Demo/screenshot → Get feedback
- **Checkpoint 2**: After styling/UI → Live preview → Get design feedback  
- **Checkpoint 3**: After interactions → User flow demo → Get UX feedback
- **Backend Tasks**: After API implementation → Test with Postman/curl → Get validation

**🧪 Test**: Comprehensive validation - ensure built solution matches spec, catch remaining issues
- **Frontend Tasks**: Cross-browser testing results → Get compatibility approval
- **All Tasks**: Test results summary → Get quality approval

**✅ Complete**: Update status, move task file, proceed to next task
- **Final Review**: Present completed feature → Get final sign-off

### 4. Continuous Operation
- After completing a task, automatically start next available task
- Handle task dependencies and blocking conditions
- Maintain project status tracking throughout
- Only pause for manual intervention when blocked

## Feedback Modes

### Default Mode (`/auto`)
- **Human Checkpoints**: 2-3 feedback points per task
- **Best For**: General development tasks, API endpoints, business logic
- **Feedback Timing**: After major milestones (functionality complete, testing complete)

### Interactive Mode (`/auto --interactive`) 
- **Human Checkpoints**: 4-6 feedback points per task
- **Best For**: Frontend development, UI/UX work, design-heavy tasks
- **Feedback Timing**: After every significant visual change or user interaction
- **Special Features**: 
  - Live preview generation for frontend changes
  - Screenshot comparisons with design mockups
  - Accessibility testing results presentation
  - Real-time style guide compliance checking

### Continuous Mode (`/auto --continuous`)
- **Human Checkpoints**: Minimal - only on errors or blockers
- **Best For**: Backend services, data processing, infrastructure tasks
- **Feedback Timing**: Only when manual intervention required
- **Runs**: Entire backlog sequentially with minimal human interaction

### Silent Mode (`/auto --silent`)
- **Human Checkpoints**: None (fully autonomous)
- **Best For**: Utility functions, unit tests, documentation updates, refactoring
- **Feedback Timing**: Only final completion notification
- **Quality Assurance**: Extra emphasis on comprehensive testing and validation

## Key Features
- **Adaptive Feedback**: Adjusts human interaction based on task type and mode
- **Visual Progress**: Screenshots, demos, and live previews for frontend work
- **Smart Pausing**: Intelligent checkpoints based on development context
- **Automatic Task Progression**: Moves tasks through folder states
- **Intelligent Retry**: Auto-fixes common build/test failures  
- **Quality Gates**: Enforces testing, security, performance standards

## Examples

### Frontend Development (Interactive Mode Recommended)
```bash
/auto --interactive "Create user profile page with avatar upload"
# Feedback checkpoints:
# 1. Component structure and routing → Get approval
# 2. Basic layout and styling → Review design
# 3. Form interactions and validation → Test UX
# 4. File upload functionality → Verify behavior
# 5. Responsive design → Check mobile/desktop
# 6. Final accessibility audit → Get sign-off

/auto --interactive "Build shopping cart with real-time updates"
# Feedback includes live demos of cart interactions, payment flow testing
```

### Backend Development (Default Mode)
```bash
/auto "Create REST API with user authentication"
# Feedback checkpoints:
# 1. API design and endpoints → Get approval  
# 2. Implementation complete → Test with Postman
# 3. Security audit results → Review findings

/auto "Implement email notification service"
# Feedback includes configuration review, test email delivery
```

### Utility/Infrastructure (Silent Mode)
```bash
/auto --silent "Refactor database connection handling"
/auto --silent "Add comprehensive unit tests for utility functions" 
/auto --silent "Update documentation for API endpoints"
# Minimal feedback - just completion notifications and final review
```

### Full Project (Continuous Mode)
```bash
/auto --continuous
# Processes entire backlog with context-appropriate feedback
# Automatically switches to interactive mode for frontend tasks
# Uses default mode for mixed tasks
# Uses silent mode for utilities and tests
```

## Automatic Task Type Detection

The AI automatically determines the appropriate feedback level based on task content:

### Frontend/UI Tasks (→ Interactive Mode)
**Keywords**: "UI", "component", "page", "form", "styling", "responsive", "design", "user interface", "frontend", "React", "Vue", "Angular"
**Feedback**: High frequency with visual previews and design validation

### Backend/API Tasks (→ Default Mode)  
**Keywords**: "API", "endpoint", "database", "authentication", "service", "backend", "server", "integration"
**Feedback**: Moderate frequency with functional testing and security review

### Utility/Infrastructure Tasks (→ Silent Mode)
**Keywords**: "refactor", "test", "documentation", "utility", "helper", "config", "setup", "migration"
**Feedback**: Minimal frequency with completion notification

### Mixed Tasks (→ Default Mode)
**Keywords**: Full-stack features, complex workflows spanning frontend and backend
**Feedback**: Adaptive frequency based on current implementation phase

## Human Feedback Process

### Feedback Request Format
```markdown
## 🎯 Checkpoint: [Phase] - [Task Name]

### Progress Overview
**Task**: [Brief task description]  
**Phase**: [Current phase: Understand/Plan/Build/Test/Complete]
**Progress**: [X/Y checkpoints completed] ████████░░ 80%

### What I've Completed
- [Specific accomplishments]
- [Key decisions made]  
- [Current status]

### What I Need Feedback On
- [Specific questions]
- [Design/implementation choices]
- [Concerns or risks]

### Preview/Demo
[Context-specific content based on task type]:

**Frontend Tasks**: 
- 📸 Screenshots: [before/after comparisons]
- 🌐 Live Preview: [localhost:3000/feature-name]
- 📱 Responsive Test: [mobile/tablet/desktop views]
- ♿ Accessibility: [screen reader test, keyboard navigation]

**Backend Tasks**:
- 🔧 API Testing: [Postman collection or curl commands]
- 📊 Database Changes: [schema updates, test data]  
- 🔒 Security Scan: [vulnerability assessment results]
- ⚡ Performance: [response times, load test results]

**General Tasks**:
- 📝 Code Changes: [key files modified, new functionality]
- 🧪 Test Results: [coverage report, passing/failing tests]
- 📋 Configuration: [environment changes, new dependencies]

### Next Steps (Pending Your Approval)
- [What I plan to do next]
- [Alternative approaches if you have concerns]
- [Estimated time to next checkpoint]

**Options**: 
- ✅ Approve & Continue
- 🔄 Request Changes: _[specify changes]_
- ✋ Pause for Discussion
- 📋 Switch Mode: _[interactive/default/silent]_
```

### Progress Visualization Tools

**For Frontend Development**:
- Automatically start local development server for live previews
- Generate before/after screenshots for visual changes
- Create mobile/desktop responsive comparisons
- Run accessibility audits with actionable results
- Compare implementation with design mockups (if available)

**For Backend Development**:
- Create API documentation with interactive examples
- Generate test data and demonstrate functionality  
- Provide security scan summaries with risk assessments
- Show performance benchmarks and optimization suggestions
- Create database diagrams for schema changes

**For All Tasks**:
- Git diff summaries highlighting key changes
- Test coverage reports with visual indicators
- Dependency change notifications with security alerts
- Configuration change summaries with environment impact

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

### Default Mode (`/auto`)
1. **Task Processing**: Process one task with 2-3 human feedback checkpoints
2. **Feedback Timing**: After understanding, after implementation, after testing
3. **Pause Points**: Waits for human approval before proceeding to next phase
4. **Task Movement**: Moves through folder states after human sign-off

### Interactive Mode (`/auto --interactive`)
1. **High-Frequency Feedback**: 4-6 checkpoints per task with visual previews
2. **Real-Time Previews**: Screenshots, live demos, code snippets at each checkpoint  
3. **Design Validation**: Compares implementation with mockups/style guides
4. **UX Testing**: Interactive demos of user workflows and edge cases
5. **Accessibility Checks**: Reports on screen reader, keyboard navigation, color contrast

### Continuous Mode (`/auto --continuous`)
1. **Minimal Interruption**: Only stops for errors, blockers, or critical decisions
2. **Smart Mode Switching**: Automatically uses interactive mode for frontend tasks
3. **Batch Processing**: Processes entire backlog with context-appropriate feedback
4. **Progress Logging**: Comprehensive logs of autonomous decisions and implementations

### Silent Mode (`/auto --silent`)  
1. **Zero Interruption**: Fully autonomous execution with comprehensive testing
2. **Final Review Only**: Presents completed work for final approval
3. **Extra Validation**: Enhanced testing and quality checks to ensure reliability
4. **Completion Summary**: Detailed report of all changes and validations performed

### Universal Behaviors
- **Task Movement**: Tasks automatically move through folder states
- **Status Updates**: Project status updated after each task state change  
- **Dependency Handling**: Respects task dependencies and blocking conditions
- **Quality Gates**: All modes enforce testing, security, performance standards
- **Emergency Stop**: Human can interrupt any mode with feedback or concerns