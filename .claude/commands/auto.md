# /auto - Automatic Development

Pick up next task and build it completely.

## Usage
- `/auto` - Build next task automatically from `tasks/todo/`
- `/auto "planned task name"` - Build specific planned task from `tasks/todo/`
- `/auto "unplanned feature"` - Run elaborate planning process then build

## How It Works

### For Planned Tasks (`/auto` or `/auto "existing task"`)
1. **Find Task**: Looks in `tasks/todo/` for next or specified task
2. **Build**: Implements with tests
3. **Verify**: Runs tests to ensure it works
4. **Complete**: Moves to `tasks/done/`

### For Unplanned Tasks (`/auto "new feature"`)
1. **Ultra Think Planning**: Run complete `/plan` process for the new feature
2. **Requirements Analysis**: Comprehensive mapping of all requirements and dependencies
3. **Task Creation**: Generate all necessary tasks with proper dependencies
4. **Dependency Resolution**: Create subtasks for any missing prerequisites
5. **Build Execution**: Automatically start building the first ready task
6. **Continue Until Complete**: Process all created tasks in dependency order

## Detailed Workflow

### Unplanned Task Detection
When `/auto "description"` is called, the system determines if it's unplanned:
```bash
# Check if task exists in tasks/todo/
if [ ! -f "tasks/todo/*${description}*" ]; then
    echo "Unplanned task detected: ${description}"
    echo "Running elaborate planning process..."
    # Trigger planning workflow
fi
```

### Elaborate Planning Process for Unplanned Tasks

#### 1. Ultra Think Requirements Analysis
- **Complete Requirements Mapping**: Extract ALL aspects of the requested feature
- **Edge Case Identification**: Identify minor details and edge cases
- **Dependency Discovery**: Map all internal and external dependencies
- **Guideline Review**: Identify all applicable guidelines and templates

#### 2. Comprehensive Task Creation
- **Primary Tasks**: Main implementation tasks for core functionality
- **Dependency Tasks**: Prerequisite tasks that must be completed first
- **Integration Tasks**: Tasks for connecting components together
- **Testing Tasks**: Comprehensive testing and validation tasks

#### 3. Dependency Resolution Process
```markdown
## Unplanned Task: "${description}"

### Requirements Analysis
- **Primary Requirements**: [All core functionality needed]
- **Edge Cases**: [Minor aspects and special scenarios]
- **Dependencies**: [All prerequisites and integrations needed]

### Generated Tasks
1. [Task 1] - [Prerequisites: none]
2. [Task 2] - [Prerequisites: Task 1]
3. [Task 3] - [Prerequisites: Task 1, Task 2]
...

### Execution Plan
- Start with: [First ready task with no dependencies]
- Continue with: [Tasks in dependency order]
- Complete when: [All tasks finished and integrated]
```

### Planned Task Execution
For existing tasks in `tasks/todo/`:
1. **Load Task**: Read task file with all specifications
2. **Verify Prerequisites**: Ensure all dependencies are met
3. **Build**: Implement with perfect adherence to specifications
4. **Test**: Comprehensive validation
5. **Complete**: Move to `tasks/done/`

Automatically transitions between phases with intelligent error handling.

## MCP-Enhanced Features
- **Context7 Integration**: Real-time access to framework docs and best practices
- **Playwright Automation**: Automated UI testing and browser-based validation
- **Serena Codebase Intelligence**: Smart code navigation and pattern analysis
- **shadcn-ui Components**: Direct access to modern UI component library
- **Desktop Commander**: Advanced file management and system operations
- **Automatic Test-Driven Development**: Enhanced with automated browser testing
- **Smart Error Handling**: MCP-powered debugging and issue resolution
- **Intelligent Task Progression**: Codebase-aware dependency management

## Examples

### Planned Task Execution
```bash
/auto
# Picks up next task from tasks/todo/ and builds it

/auto "add user login"
# Builds specific login task if it exists in tasks/todo/
```

### Unplanned Task with Elaborate Planning
```bash
/auto "implement user authentication system"
# Since this task doesn't exist in tasks/todo/, triggers:
# 1. Ultra Think analysis of authentication requirements
# 2. Comprehensive task breakdown:
#    - Create user registration form
#    - Implement password hashing
#    - Build JWT token system
#    - Create login/logout endpoints
#    - Add session management
#    - Implement password reset
#    - Create user profile management
# 3. Dependency mapping and resolution
# 4. Automatic execution starting with first ready task

/auto "add shopping cart functionality"
# Triggers complete planning process:
# 1. Requirements analysis (cart items, quantities, persistence, etc.)
# 2. Task creation with dependencies:
#    - Create cart data model
#    - Implement add/remove items API
#    - Build cart UI components
#    - Add persistence layer
#    - Create checkout integration
# 3. Execute all tasks in dependency order
```

### Planning Process Output Example
```bash
/auto "user dashboard with analytics"

# Planning Process Triggered:
# 📋 Ultra Think Analysis: Analyzing user dashboard requirements...
# 🔍 Requirements Identified: 15 core requirements, 8 edge cases
# 📊 Dependencies Mapped: Authentication, data visualization, API integration
# ✅ Tasks Created: 12 tasks generated in tasks/todo/
# 🚀 Starting Execution: Beginning with "Create dashboard data models"
```






## What Happens

### Pre-Execution: Essential MCP Server Verification
Before any task execution, ensure these MCP servers are running:
- **Context7**: Up-to-date code documentation and framework guidance
- **Playwright**: Browser automation for UI testing and validation
- **Serena**: Codebase indexing and intelligent code navigation
- **shadcn-ui**: Access to shadcn/ui v4 components and patterns
- **Desktop Commander**: File management and terminal command execution

### For Planned Tasks
1. **MCP Verification**: Ensure all essential MCP servers are active
2. **Find Task**: Scans `tasks/todo/` for next or specified task file
3. **Load Specifications**: Reads complete task requirements and dependencies
4. **Build**: Implements feature with test-driven development using MCP capabilities
5. **Test**: Runs all tests and fixes any failures with Playwright automation
6. **Complete**: Moves task to `tasks/done/` and reports completion

### For Unplanned Tasks
1. **MCP Verification**: Ensure all essential MCP servers are active
2. **Detect Unplanned**: Determines task doesn't exist in `tasks/todo/`
3. **Ultra Think Planning**: Runs complete `/plan` process with MCP enhancement:
   - **Context7**: Framework documentation and best practices
   - **Serena**: Codebase analysis for existing patterns
   - Complete requirements mapping (ALL aspects covered)
   - Edge case identification (minor details included)
   - Dependency analysis (internal and external dependencies)
   - Guideline review (template and pattern adherence)
4. **Task Generation**: Creates ALL necessary tasks with:
   - Primary implementation tasks
   - Dependency/prerequisite tasks
   - Integration tasks
   - Comprehensive testing tasks (with Playwright automation)
5. **Dependency Resolution**: Orders tasks by dependencies
6. **MCP-Enhanced Execution**: Builds all tasks with:
   - **shadcn-ui**: Component selection and implementation
   - **Desktop Commander**: File operations and terminal commands
   - **Playwright**: Automated UI testing and validation
   - **Context7**: Real-time documentation and guidance
7. **Complete Integration**: Ensures all tasks work together

### Smart Task Ordering
```bash
# Example dependency resolution:
Task A (no dependencies) → Execute first
Task B (depends on A) → Execute after A completes
Task C (depends on A, B) → Execute after both A and B complete
```

Runs completely automatically with intelligent error handling and perfect requirements adherence.