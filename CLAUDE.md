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
| `/build` | TDD implementation | Red-Green-Refactor, auto-approval, quality gates, MCP enhanced |
| `/test` | Comprehensive validation | 90%+ coverage, security, performance, auto-retry, MCP enhanced |
| `/ship` | Production deployment | Monitoring, rollback, documentation, MCP enhanced |
| `/auto` | **Fully autonomous workflow** | **Complete end-to-end solution with MCP integration** |

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
1. **Red Phase**: Write failing tests first
2. **Green Phase**: Implement minimal code to pass tests  
3. **Refactor Phase**: Improve code while keeping tests green
4. **Coverage**: Maintain >90% test coverage
5. **Auto-retry**: Failed tests trigger build phase fixes

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
│   ├── unit/           # >90% coverage
│   ├── integration/    # API/component tests
│   ├── e2e/            # End-to-end workflows
│   └── performance/    # Load and performance tests
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

## Auto-Approved Commands

These commands run without confirmation for autonomous development:

**Package Managers**: `npm`, `npx`, `uv`, `pip`, `yarn`
**Development**: `python`, `node`, `go`, `tsc`, `pytest`, `jest`
**Version Control**: `git status`, `git add`, `git commit`, `git diff`
**File Operations**: `mkdir`, `touch`, `cp`, `mv`, `chmod`
**Utilities**: `curl`, `echo`, `cat`, `grep`, `find`, `ls`

**Excluded (Require Approval)**: `sudo`, `rm -rf`, `npm publish`, system packages

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

- **>90% test coverage** with comprehensive edge case testing
- **Security validation** on all inputs and dependencies
- **Performance benchmarks** must pass
- **TDD methodology** strictly enforced
- **Blocker resolution** before implementation begins

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

## Quick Commands

```bash
# Setup MCP servers (one-time)
/setup-mcp

# Start fully autonomous development
/auto "Create a REST API with authentication"

# Check workflow status
cat ./.claude/workflow/current_task.json

# Monitor progress
tail -f ./.claude/logs/autonomous-workflow.log
```

## Key Principles for AI Agents

1. **Deep Analysis First** - Always understand before implementing
2. **Break Down Ruthlessly** - No task >4 hours, make them actionable/testable  
3. **Test-First Always** - Write failing tests before any code
4. **Resolve Blockers Automatically** - Don't wait for human intervention
5. **Quality Over Speed** - Better to build right once than fix repeatedly
6. **Alert Only When Necessary** - Minimize human interruptions

Remember: This workflow prioritizes **thoughtful execution** and **autonomous quality delivery** over rapid feature development.