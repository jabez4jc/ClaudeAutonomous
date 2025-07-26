# CLAUDE.md - Simple Development Workflow

**Philosophy**: "Build intelligently using Ultra Think with structured intent, enforce integrity through automated quality gates, evolve through feedback, and always prioritize alignment with human purpose."

This file provides guidance to Claude Code when working with code in this repository.

## Core Commands

| Command | Purpose |
|---------|---------|
| `/mcp-check` | Verify essential MCP servers are running |
| `/dev` | Start/stop development servers |
| `/plan` | Break features into tasks (MCP-enhanced) |
| `/auto` | Build next task automatically (MCP-powered) |
| `/build` | Implement features with TDD (MCP-enhanced) |
| `/test` | Run comprehensive tests (Playwright automation) |
| `/ship` | Deploy to production |

## Simple Workflow

```
Plan → Auto → (Build → Test →) Ship
```

1. **`/plan`** - Break features into small tasks
2. **`/auto`** - Automatically build tasks with TDD
   - **Planned tasks**: Builds existing tasks from `tasks/todo/`
   - **Unplanned tasks**: Runs elaborate planning process first, then builds
3. **`/ship`** - Deploy when ready

## Task Management

**Simple Structure**:
```
tasks/
├── todo/     # Ready to work on
└── done/     # Completed tasks
```

**Task Format** (for user reference only - not used in planning):
```markdown
# Task: [What to build]

## Requirements Coverage
- Primary requirement and all related aspects
- Edge cases and minor details

## Dependencies  
- Prerequisites and external requirements
- Internal component dependencies

## Guideline Adherence
- Specific guidelines to follow exactly
- Templates to match pixel-perfect

## Success Criteria
- Complete requirement fulfillment
- Perfect guideline compliance
- Comprehensive testing
```

## Development Process

### `/dev` - Development Servers
- Automatically kills conflicting processes
- Starts frontend, backend, database in correct order
- Health checks ensure everything is ready
- Simple commands: `/dev start`, `/dev stop`, `/dev status`

### `/plan` - Ultra Think Planning
- **Complete Requirements Mapping**: Identify ALL requirements including minor aspects and edge cases
- **Strict Guideline Adherence**: Follow provided frontend/backend/database guidelines exactly
- **Template Compliance**: Adhere to provided design templates and documents at all costs
- **Dependency Analysis**: Map every internal and external dependency clearly
- **Zero-Gap Coverage**: Ensure no requirements are missed through systematic review

### `/auto` - MCP-Enhanced Automatic Development
- **MCP Server Verification**: Ensures all essential MCP servers are running
- **Enhanced Planning**: Uses Context7, Serena, and shadcn-ui for intelligent analysis
- **Perfect Implementation**: Builds features with MCP-powered precision and zero hallucinations
- **Automated Testing**: Playwright-driven UI testing and comprehensive validation
- **Strict Adherence**: Follows all guidelines and templates exactly as specified
- **Quality Gates**: Ensures perfect requirements match and template compliance

### Quality Standards
- **Perfect Requirements Match**: 100% compliance with all specified requirements
- **Strict Guideline Adherence**: All provided guidelines followed without exception
- **Template Compliance**: Design templates matched pixel-perfect
- **Zero Hallucinations**: No assumptions, interpretations, or creative additions
- **Comprehensive Testing**: >90% test coverage with specification validation
- **Security Compliance**: No vulnerabilities, follows security guidelines exactly

## Project Setup

### Supported Project Types
- Next.js applications
- React + Node.js
- Python + FastAPI
- Full-stack web apps
- Microservices

### Auto-Detected Configuration
- Package managers (npm, yarn, pnpm, uv)
- Development servers
- Test frameworks
- Database setup

## Error Handling

- Automatic retry on common failures
- Smart dependency resolution
- Clear error reporting
- Suggests fixes for issues

## Key Principles

1. **Ultra Think with Structured Intent** - Deep analysis before building, guided by clear structure
2. **Automated Quality Gates** - Enforce integrity through comprehensive testing and validation
3. **Feedback-Driven Evolution** - Continuously improve through human feedback and iteration
4. **Human-Purpose Alignment** - Always prioritize what serves human needs and goals
5. **Intelligent Automation** - Smart phase transitions with minimal manual intervention

## Quick Start

### Essential MCP Setup (One-time)
```bash
# Verify MCP servers are running
/mcp-check

# If servers missing, install essentials:
# - Context7 (framework docs)
# - Playwright (UI automation) 
# - Serena (codebase analysis)
# - shadcn-ui (component library)
# - Desktop Commander (file management)
```

### With Planning First
```bash
# Verify MCP servers
/mcp-check

# Plan your feature (MCP-enhanced)
/plan "user authentication"

# Build all tasks automatically (MCP-powered)
/auto

# Deploy when ready
/ship
```

### Direct Unplanned Development
```bash
# Verify MCP servers and plan+build in one command
/auto "user authentication system"
# Triggers MCP-enhanced planning process, then builds all tasks

# Deploy when ready
/ship
```

The workflow combines Ultra Think analysis with automated execution, enforcing integrity through quality gates while evolving through feedback and maintaining alignment with human purpose.