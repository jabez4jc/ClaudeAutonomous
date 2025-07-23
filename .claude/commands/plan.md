# /plan - Ultra Deep Thinking Planning

"Ultra Think before you build" - Comprehensive analysis prevents problems before they occur.

## Planning Process

**📖 Documentation Review** (First Step):
- Read `docs/requirements/` for business requirements and user stories
- Analyze `docs/design/` for technical specifications and constraints
- Review `docs/guidelines/` for coding standards and patterns
- **Context7 MCP**: Access framework documentation and best practices
- **Memory Bank MCP**: Retrieve previous project insights and decisions

**🧠 Problem Analysis**: Core problem, user impact, business value (informed by documentation)
**🏗️ Solution Architecture**: Multiple approaches, trade-offs, recommended solution (using GitHub MCP + docs)
**📋 Task Breakdown**: <4hr micro-tasks with clear acceptance criteria (Sequential Thinking MCP)
**🔗 Dependency Mapping**: Internal/external dependencies with critical path (Database MCP + specs)
**🚧 Blocker Detection**: Technical, resource, knowledge, process blockers

## Task Format Template
```markdown
# Task: [Action Title - Max 8 words]

**Context**: Problem solved, user value, priority (1-4hrs)
**Pre-conditions**: Dependencies, tools, environment
**Success Criteria**: Functional, testing (>90%), integration, error handling
**TDD Plan**: Red → Green → Refactor phases
**Technical Notes**: Architecture, dependencies, data models, security
**Acceptance Tests**: Given/When/Then scenarios
**Risks**: Technical challenges, assumptions, mitigations
**Definition of Done**: Implementation, tests, docs, ready for deployment
```

## Dependency Types
**External**: APIs, infrastructure, data sources, cloud services
**Internal**: Task sequence, components, libraries, team knowledge

## Blocker Categories
**Technical**: Missing tools, unclear requirements, architecture decisions
**Resource**: Access, permissions, infrastructure, budget constraints
**Knowledge**: Research needed, expertise gaps, missing documentation
**Process**: Approvals, designs, security reviews, environment setup

## Task States
`analysis/` → `backlog/` → `in-progress/` → `testing/` → `completed/`

## Planning Session
1. Problem statement and deep thinking (30-45 min)
2. Multiple solution approaches with trade-offs
3. Solution selection with rationale
4. Granular micro-task breakdown (<4hrs each)
5. Dependency mapping and critical path
6. Blocker identification and resolution
7. Success criteria and test plans

## Status Check
```bash
cat .claude/project_status.json
find tasks/ -name "*.md" | head -10
cat .claude/workflow/blockers.json
```