# CLAUDE.md - AI-Driven Development Workflow

This file provides guidance to Claude Code when working with code in this repository.

## Core Philosophy

**"Ultra Think before you build and you won't break anything"**

Emphasize **deep thinking**, **prevention over fixing**, and **autonomous execution** over speed:

1. **Ultra Think Before You Build** - Question assumptions, understand deeply, prevent problems through analysis
2. **Test-Driven Quality** - Write tests first, ensure >90% coverage
3. **Autonomous Execution** - Minimize human intervention through intelligent automation
4. **Granular Tasks** - Break work into <4 hour actionable, testable items
5. **Blocker Resolution** - Automatically resolve dependencies before building

## Core Commands

| Command | Purpose | Key Features |
|---------|---------|--------------|
| `/setup-mcp` | MCP server installation | One-time setup of 9 essential MCP servers |
| `/project` | Intelligent project setup | 15+ app types, auto tech stacks, custom builder |
| `/plan` | Deep thinking planning | Problem analysis, dependency mapping, blocker detection, MCP enhanced |
| `/plan --complete` | Complete task planning | Create ALL tasks in one session (45-60 min) |
| `/plan-continue` | Continue planning | Generate remaining tasks from analysis summaries |
| `/build` | TDD implementation | Red-Green-Refactor, auto-approval, quality gates, MCP enhanced |
| `/test` | Comprehensive validation | 90%+ coverage, security, performance, auto-retry, MCP enhanced |
| `/ship` | Production deployment | Monitoring, rollback, documentation, MCP enhanced |
| `/auto` | **Feedback-driven workflow** | **Task execution with human checkpoints and validation** |
| `/auto --interactive` | **Interactive frontend development** | **High-frequency feedback with visual previews for UI work** |
| `/auto --continuous` | **Smart continuous execution** | **Context-adaptive feedback based on task type** |
| `/auto --silent` | **Fully autonomous workflow** | **Zero-interruption execution for utilities and infrastructure** |

## Workflow Process

```
Understand → Plan → Build → Test → (Retry if needed) → Ship
```

### Deep Thinking Required (MCP Enhanced)
- **Documentation Reading**: First step - analyze all docs/ content + Context7 MCP for framework docs
- **Planning Phase**: 30-45 minutes comprehensive analysis with Memory Bank MCP
- **Multiple Solutions**: Evaluate 2-3 approaches before selection using GitHub MCP analysis
- **Dependency Mapping**: Comprehensive internal/external dependency analysis with Database MCP
- **Blocker Classification**: Identify technical, resource, knowledge, and process blockers
- **Critical Path Analysis**: Create task dependency graphs with timelines using Sequential Thinking MCP
- **Granular Breakdown**: Every task <4 hours, highly actionable and testable

### Test-Driven Development (Mandatory)

#### Test Creation During `/build` Phase
1. **Unit Tests (Red Phase)**: Write failing tests BEFORE implementing each function/method
   - Location: `tests/unit/` 
   - Purpose: Test individual functions in isolation
   - When: Immediately before implementing each component

2. **Integration Tests (Green Phase)**: Create DURING implementation of component interactions
   - Location: `tests/integration/`
   - Purpose: Test API endpoints, database operations, service interactions
   - When: As you implement APIs, database queries, external service calls

3. **E2E Tests (Refactor Phase)**: Create AFTER core functionality is complete
   - Location: `tests/e2e/`
   - Purpose: Test complete user workflows and system behavior
   - When: Before moving from `/build` to `/test` phase

4. **Performance Tests (Optimization Phase)**: Create AFTER basic functionality works
   - Location: `tests/performance/`
   - Purpose: Load testing, response time validation, resource usage
   - When: During performance optimization phase

#### Test Execution During `/test` Phase (Required Order)
1. **Unit Tests** → Fix logic issues (>90% coverage required)
2. **Integration Tests** → Fix component interactions (>80% coverage required)  
3. **E2E Tests** → Fix user experience issues (100% critical paths required)
4. **Performance Tests** → Optimize performance (<200ms response times required)
5. **Security Tests** → Fix vulnerabilities (no critical issues allowed)
6. **Chaos Tests** → Implement resilience (auto-recovery required)

All tests must pass in sequence before proceeding to `/ship` phase.

### Automatic Blocker Resolution
Before build phase, automatically:
- Install missing dependencies and tools
- Resolve environment configuration issues  
- Set up development databases and services
- Configure CI/CD pipelines
- Only proceed when all blockers resolved

## Project Structure

```
your-project/
├── docs/                # Documentation and specifications
│   ├── requirements/    # Business requirements, user stories  
│   ├── design/         # Technical specs, architecture, UI/UX
│   │   ├── ui-mockups/ # Wireframes, mockups, screenshots
│   │   ├── api-specs/  # OpenAPI/Swagger specifications
│   │   └── architecture/ # System architecture diagrams
│   └── guidelines/     # Coding standards, style guides
├── tasks/
│   ├── analysis/       # Deep thinking phase
│   ├── backlog/        # Ready for implementation  
│   ├── in-progress/    # TDD development
│   ├── testing/        # Validation phase
│   └── completed/      # Fully verified
├── src/                # Source code (varies by type)
├── tests/              # Comprehensive test suites
│   ├── unit/           # >90% coverage, individual functions
│   ├── integration/    # API/component interactions
│   ├── e2e/            # Complete user workflows
│   ├── performance/    # Load testing, response times
│   ├── security/       # Vulnerability scanning, auth testing
│   └── resilience/     # Chaos testing, auto-recovery
├── .env.example        # Environment configuration template
└── .claude/
    ├── commands/       # Slash command definitions
    ├── workflow/       # Autonomous orchestration
    └── settings.local.json # Auto-approval config
```

## Task Format (Required)

Every task must include:

```markdown
# Task: [Specific Title - Max 8 words]

## Context & Purpose
- **Problem**: What specific problem does this solve?
- **User Value**: How does this benefit the end user?
- **Effort**: 1-4 hours (break down if larger)

## Success Criteria (Testable)
- [ ] Core functionality works as specified
- [ ] Unit tests written and passing (>90% coverage)
- [ ] Integration tests pass
- [ ] Error handling implemented
- [ ] Security review passed
- [ ] Documentation updated

## Test-Driven Development Plan
1. **Red**: Write failing tests defining behavior
2. **Green**: Implement minimal code to pass
3. **Refactor**: Improve while keeping tests green
```

## Auto-Approved Commands & Dependency Management

### Project-Isolated Dependencies (Required)
**All application dependencies MUST be contained within the project directory. No global installations.**

**Python**: Use Astral UV exclusively
- `uv add package-name` (✅ auto-approved)
- `uv run python script.py` (✅ auto-approved)
- `pip install package-name` (❌ requires approval - global installation)

**Node.js**: Use pnpm/yarn/npm locally only
- `pnpm add package-name` (✅ auto-approved)
- `npm install package-name` (✅ auto-approved)
- `npm install -g package-name` (❌ requires approval - global installation)

### Auto-Approved Commands
**Package Managers (Local)**: `uv add`, `uv run`, `pnpm add`, `yarn add`, `npm install`, `npx`
**Development**: `python`, `node`, `go`, `tsc`, `pytest`, `jest`
**Version Control**: `git status`, `git add`, `git commit`, `git diff`
**File Operations**: `mkdir`, `touch`, `cp`, `mv`, `chmod`
**Utilities**: `curl`, `echo`, `cat`, `grep`, `find`, `ls`

**Require Approval (Global/System)**: `pip install`, `npm install -g`, `yarn global add`, `sudo pip`, system packages

## Documentation & Requirements

The workflow automatically discovers and processes documentation you provide:

### Supported Formats
- **Requirements**: PDF, Word, Markdown, Excel, plain text
- **Design Documents**: Figma, Sketch, Adobe XD, image files
- **Technical Specs**: Markdown, YAML, JSON, OpenAPI/Swagger
- **Style Guides**: JSON, CSS, design tokens

### Key Files to Add
- **`docs/requirements/`** - Business requirements, user stories, acceptance criteria
- **`docs/design/style-guide.json`** - Brand colors, typography, spacing, components
- **`docs/design/tech-specifications.md`** - Architecture, API design, framework choices
- **`docs/guidelines/coding-standards.md`** - File organization, patterns, testing requirements
- **`.env.example`** - Database URLs, API keys, service configurations

### Usage
```bash
# Add your documentation
cp requirements.pdf docs/requirements/
cp mockups.figma docs/design/ui-mockups/  
cp api-spec.yaml docs/design/api-specs/

# System automatically reads all docs during planning
/project  # Discovers and configures based on docs
/plan     # Analyzes requirements and creates tasks
/auto     # Fully autonomous implementation following all specs
```

## Quality Standards

### Test Coverage Requirements
- **Unit Tests**: >90% line coverage, >85% branch coverage (all public functions, edge cases, error conditions)
- **Integration Tests**: >80% coverage of integration points (API endpoints, database operations, service interactions)
- **E2E Tests**: 100% coverage of critical user journeys (authentication flows, data persistence, complete workflows)
- **Performance Tests**: All high-traffic endpoints (<200ms response times, expected load handling)
- **Security Tests**: All input points, authentication, authorization (OWASP Top 10 compliance)
- **Chaos Tests**: All failure scenarios, recovery mechanisms (auto-recovery, graceful degradation)

### Quality Gates (Must Pass in Order)
1. ✅ **Unit Tests**: >90% coverage, all pass, fast execution (<30s)
2. ✅ **Integration Tests**: >80% coverage, all endpoints work, database operations succeed  
3. ✅ **E2E Tests**: 100% critical paths pass, UI interactions work, data persists
4. ✅ **Performance Tests**: Response times <200ms, handles expected load, no memory leaks
5. ✅ **Security Tests**: No critical vulnerabilities, auth secure, inputs validated
6. ✅ **Chaos Tests**: Auto-recovery works, graceful degradation, no data loss

### Additional Standards
- **TDD methodology** strictly enforced (Red-Green-Refactor cycle)
- **Blocker resolution** before implementation begins
- **Security validation** on all inputs and dependencies

## Autonomous Features

- **Zero Human Intervention**: Runs until completion or unrecoverable failure
- **Intelligent Retry**: Build failures (3 attempts), test failures (2 attempts)
- **Dependency Awareness**: Respects task dependencies automatically
- **Alert Integration**: Only notifies when manual intervention required
- **Progress Tracking**: Comprehensive logging and status monitoring

## MCP Integration

This workflow is enhanced with 9 essential MCP servers:

- **Memory Bank MCP**: Preserve insights across sessions
- **GitHub MCP**: Repository analysis and automation  
- **Sequential Thinking MCP**: Enhanced problem breakdown
- **Database MCP**: Schema analysis and migrations
- **Puppeteer MCP**: Automated E2E testing
- **File System MCP**: Enhanced file operations
- **Notion MCP**: Documentation management
- **Figma MCP**: Design-to-code workflow
- **Context7 MCP**: Tech documentation understanding

### Setup MCP Servers (One-time)
```bash
/setup-mcp
```

## Enhanced Planning Options

### Standard Planning (Phased Approach)
```bash
/plan                    # Initial planning with 3-5 primary tasks
/plan-continue           # Generate remaining tasks from analysis summaries
```

### Complete Planning (All Tasks Upfront)
```bash
/plan --complete         # Create ALL detailed tasks in one 45-60 min session
```

## Enhanced Autonomous Execution

### Single Task Processing
```bash
/auto                    # Process next available task from backlog
/auto "specific task"    # Execute specific task description
```

### Continuous Processing
```bash
/auto --continuous       # Process entire backlog sequentially
                        # Automatic task folder management:
                        # backlog → in-progress → testing → completed
```

## Quick Commands

```bash
# Setup MCP servers (one-time)
/setup-mcp

# Complete planning + continuous execution
/plan --complete && /auto --continuous

# Monitor autonomous workflow
tail -f ./.claude/logs/autonomous-workflow.log

# Check project status
cat ./.claude/project_status.json

# View task distribution
find tasks/ -name "*.md" | sort
```

## Key Principles for AI Agents

1. **Deep Analysis First** - Always understand before implementing
2. **Break Down Ruthlessly** - No task >4 hours, make them actionable/testable  
3. **Test-First Always** - Write failing tests before any code
4. **Resolve Blockers Automatically** - Don't wait for human intervention
5. **Quality Over Speed** - Better to build right once than fix repeatedly
6. **Alert Only When Necessary** - Minimize human interruptions

Remember: This workflow prioritizes **thoughtful execution** and **autonomous quality delivery** over rapid feature development.