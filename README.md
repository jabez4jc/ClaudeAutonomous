# AI-Driven Development Workflow

> **"Ultra Think before you build and you won't break anything"**

A streamlined, autonomous development workflow where AI agents prioritize **deep thinking**, **prevention over fixing**, and **intelligent automation** over rapid delivery.

## 🚀 Quick Start

```bash
# 1. Setup MCP servers (one-time)
/setup-mcp

# 2. Start autonomous development
/auto "Create a REST API with user authentication"

# 3. Or use step-by-step approach
/project  # Initialize with 15+ app types
/plan     # Deep thinking + dependency mapping (MCP enhanced)
/build    # TDD implementation (MCP enhanced)
/test     # 90%+ coverage validation (MCP enhanced)
/ship     # Production deployment (MCP enhanced)
```

## 🎯 Core Philosophy

1. **Ultra Think Before You Build** - Comprehensive analysis prevents problems before they occur
2. **Test-Driven Quality** - Write tests first, ensure >90% coverage  
3. **Autonomous Execution** - Minimal human intervention
4. **Granular Tasks** - Break work into <4 hour actionable items
5. **Blocker Resolution** - Automatically resolve dependencies

## ⚡ Key Features

### What's New
- **🤖 Fully Autonomous Workflow** - `/auto` command handles everything
- **🧠 Deep Thinking Planning** - 30-45 minute analysis phases required
- **📱 15+ Application Types** - Web apps, mobile, APIs, CLIs with auto tech stacks
- **🔗 Dependency Mapping** - Comprehensive analysis of all dependencies
- **🚧 Smart Blocker Detection** - Identifies and resolves blockers automatically
- **🧪 Strict TDD** - Red-Green-Refactor methodology enforced
- **📊 90%+ Test Coverage** - Comprehensive validation requirements
- **🔔 Alert System** - Audio/visual alerts when attention needed
- **🔌 MCP Integration** - Enhanced with Memory Bank, GitHub, Database, Puppeteer, and Context7 servers

### Application Types Supported

**🌐 Web Applications**
- **Next.js Full-Stack**: Next.js 14+ + shadcn/ui + Tailwind CSS + Prisma
- **React + Node.js**: Vite + React 18 + Express + PostgreSQL
- **Vue + Python**: Nuxt 3 + FastAPI + SQLAlchemy  
- **Custom Stack Builder**: Complete flexibility with guided selection

**📱 Mobile Applications**
- **Native iOS**: Swift + SwiftUI + Core Data
- **Native Android**: Kotlin + Jetpack Compose + Room
- **Cross-Platform**: React Native/Flutter + TypeScript/Dart

**🔌 APIs & Backend**
- **Python**: FastAPI + SQLAlchemy + PostgreSQL + pytest
- **Node.js**: Express/Fastify + TypeScript + TypeORM + Jest
- **Go**: Gin/Echo + GORM + comprehensive testing

## 🤖 Enhanced Commands

| Command | Purpose | Key Features |
|---------|---------|--------------|
| `/project` | Intelligent project setup | 15+ app types, auto tech stacks, custom builder |
| `/plan` | Deep thinking planning | Problem analysis, dependency mapping, blocker detection |
| `/build` | TDD implementation | Red-Green-Refactor, auto-approval, quality gates |
| `/test` | Comprehensive validation | 90%+ coverage, security, performance, auto-retry |
| `/ship` | Production deployment | Monitoring, rollback, documentation |
| `/auto` | **Fully autonomous workflow** | **Complete end-to-end solution** |

## 📁 Enhanced Project Structure

```
your-project/
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
│   └── e2e/            # End-to-end workflows
└── .claude/
    ├── commands/       # Enhanced slash commands
    ├── workflow/       # Autonomous orchestration
    ├── hooks/          # Alert system
    └── settings.local.json # Auto-approval config
```

## 🧠 Deep Thinking Process

Every `/plan` command includes:

1. **Problem Analysis** (30-45 minutes comprehensive analysis)
2. **Multiple Solution Evaluation** (2-3 approaches considered)
3. **Dependency Mapping** (internal/external dependencies)
4. **Blocker Classification** (technical, resource, knowledge, process)
5. **Critical Path Analysis** (task dependency graphs)
6. **Granular Breakdown** (every task <4 hours, actionable)

## 🧪 Test-Driven Development (Mandatory)

1. **Red Phase**: Write failing tests first
2. **Green Phase**: Implement minimal code to pass tests
3. **Refactor Phase**: Improve code while keeping tests green
4. **Coverage**: Maintain >90% test coverage
5. **Auto-retry**: Failed tests trigger build phase fixes

## 🔧 Auto-Approved Commands

These commands run without confirmation for autonomous development:

- **Package Managers**: `npm`, `npx`, `uv`, `pip`, `yarn`
- **Development**: `python`, `node`, `go`, `tsc`, `pytest`, `jest`
- **Version Control**: `git status`, `git add`, `git commit`, `git diff`
- **File Operations**: `mkdir`, `touch`, `cp`, `mv`, `chmod`
- **Utilities**: `curl`, `echo`, `cat`, `grep`, `find`, `ls`
- **Servers**: `uvicorn`, `gunicorn`, `flask run`

## 📋 Adding Requirements & Specifications

The workflow automatically discovers and processes documentation you provide:

### 📁 Document Structure
```
your-project/
├── docs/
│   ├── requirements/     # Business requirements, user stories
│   ├── design/          # Technical specs, architecture, UI/UX
│   │   ├── ui-mockups/  # Wireframes, mockups, screenshots
│   │   ├── api-specs/   # OpenAPI/Swagger specifications
│   │   └── architecture/# System architecture diagrams
│   └── guidelines/      # Coding standards, style guides
├── .env.example         # API keys, service URLs, configuration
└── README.md           # Project overview
```

### 📄 Requirements Documents
```bash
# Add business requirements (any format)
mkdir -p docs/requirements
cp your-requirements.pdf docs/requirements/
cp user-stories.md docs/requirements/
cp acceptance-criteria.xlsx docs/requirements/

# System automatically reads: PDF, Word, Markdown, Excel, plain text
```

### 🎨 Design Documents & UI Guidelines
```bash
# UI/UX specifications
mkdir -p docs/design/ui-mockups
cp wireframes.figma docs/design/ui-mockups/
cp mockups/*.png docs/design/ui-mockups/
cp design-system.pdf docs/design/

# Style guide (structured format recommended)
cat > docs/design/style-guide.json << EOF
{
  "brand": {
    "name": "TaskMaster Pro",
    "colors": {
      "primary": "#1a73e8",
      "secondary": "#34a853", 
      "accent": "#ea4335",
      "background": "#f8f9fa",
      "text": "#202124"
    },
    "typography": {
      "headings": "Inter",
      "body": "Roboto",
      "code": "JetBrains Mono"
    },
    "spacing": {
      "unit": "8px",
      "scale": [4, 8, 16, 24, 32, 48, 64]
    }
  },
  "components": {
    "buttons": {
      "borderRadius": "6px",
      "padding": "12px 24px",
      "variants": ["primary", "secondary", "outline", "ghost"]
    },
    "forms": {
      "inputHeight": "40px",
      "validation": "inline-errors"
    }
  }
}
EOF
```

### ⚙️ Technical Specifications
```bash
# Architecture and tech stack preferences
cat > docs/design/tech-specifications.md << EOF
# Technical Specifications

## Architecture
- **Pattern**: Microservices with API Gateway
- **Frontend**: Next.js 14+ with App Router
- **Backend**: Node.js + TypeScript + Express
- **Database**: PostgreSQL with Prisma ORM
- **Cache**: Redis for sessions and caching
- **Queue**: Bull Queue with Redis

## API Design
- **Style**: RESTful with OpenAPI 3.0 documentation
- **Authentication**: JWT tokens with refresh mechanism
- **Rate Limiting**: 100 requests/minute per user
- **Pagination**: Cursor-based for performance
- **Error Format**: RFC 7807 Problem Details

## Code Standards
- **Linting**: ESLint with Airbnb config
- **Formatting**: Prettier with 2-space indentation
- **Testing**: Jest + Testing Library, >90% coverage
- **Documentation**: TSDoc for all functions
EOF

# API specifications (OpenAPI/Swagger)
cp api-specification.yaml docs/design/api-specs/
```

### 🔧 Environment & Configuration
```bash
# Development environment setup
cat > .env.example << EOF
# Database
DATABASE_URL=postgresql://user:password@localhost:5432/taskmaster_dev
REDIS_URL=redis://localhost:6379

# Authentication
JWT_SECRET=your-jwt-secret-key
JWT_EXPIRES_IN=7d
REFRESH_TOKEN_EXPIRES_IN=30d

# External Services
SENDGRID_API_KEY=SG.your-api-key
STRIPE_PUBLISHABLE_KEY=pk_test_your-key
STRIPE_SECRET_KEY=sk_test_your-key
STRIPE_WEBHOOK_SECRET=whsec_your-webhook-secret

# File Storage
AWS_ACCESS_KEY_ID=your-access-key
AWS_SECRET_ACCESS_KEY=your-secret-key
AWS_S3_BUCKET=taskmaster-uploads
AWS_REGION=us-east-1

# Monitoring
SENTRY_DSN=your-sentry-dsn
LOG_LEVEL=info
EOF
```

### 📐 Coding Guidelines & Standards
```bash
# Project-specific coding standards
cat > docs/guidelines/coding-standards.md << EOF
# Coding Standards

## File Organization
- **Components**: PascalCase (UserProfile.tsx)
- **Utilities**: camelCase (formatDate.ts)
- **Constants**: UPPER_SNAKE_CASE (API_ENDPOINTS.ts)
- **Types**: PascalCase with T prefix (TUser, TApiResponse)

## Code Patterns
- **Error Handling**: Always use Result<T, E> pattern
- **Async Operations**: Prefer async/await over Promises
- **State Management**: Zustand for client state, TanStack Query for server state
- **Component Structure**: Props interface, component, export default

## Testing Requirements
- **Unit Tests**: Every utility function and hook
- **Integration Tests**: All API endpoints
- **E2E Tests**: Critical user journeys
- **Coverage**: >90% line coverage, >85% branch coverage

## Performance Standards
- **Page Load**: <2 seconds on 3G
- **API Response**: <200ms for simple queries
- **Bundle Size**: <500KB initial load
- **Lighthouse**: >90 Performance, >95 Accessibility
EOF
```

## 🎯 Usage Examples

### Starting with Documentation
```bash
# 1. Add all your documentation first
mkdir -p docs/{requirements,design,guidelines}
cp requirements.pdf docs/requirements/
cp mockups.figma docs/design/ui-mockups/
cp api-spec.yaml docs/design/api-specs/
cp .env.example ./

# 2. Initialize project (automatically discovers documents)
/project

# 3. AI analyzes all documents and creates comprehensive plan
/plan
# System reads all docs and creates tasks based on requirements, 
# following design specs and coding guidelines

# 4. Execute (AI follows all specifications automatically)
/auto
```

### Fully Autonomous with Specifications
```bash
# Place documentation
cp project-spec.pdf docs/requirements/
cp wireframes/* docs/design/ui-mockups/
cp style-guide.json docs/design/

# Single command handles everything
/auto "Build the application according to the specifications in docs/"
# System: reads specs → analyzes requirements → follows design → implements → tests → deploys
```

### Adding Requirements Mid-Development
```bash
# Add new requirements anytime
cp new-feature-spec.md docs/requirements/

# Plan new features (AI considers existing code + new requirements)
/plan "Implement the notification system as specified in new-feature-spec.md"
```

### Custom Tech Stack with Guidelines
```bash
# Specify exact tech choices
cat > docs/design/tech-stack.json << EOF
{
  "frontend": {
    "framework": "React 18",
    "bundler": "Vite", 
    "ui": "Mantine + Tailwind CSS",
    "state": "Zustand",
    "routing": "React Router v6"
  },
  "backend": {
    "runtime": "Node.js 20",
    "framework": "Fastify",
    "orm": "Drizzle",
    "database": "PostgreSQL",
    "validation": "Zod"
  }
}
EOF

/project
# Choose: Custom Tech Stack → System reads tech-stack.json and configures exactly as specified
```

### Step-by-Step Development
```bash
# 1. Initialize with discovered documentation
/project
# System automatically finds and reads all docs/ content

# 2. Plan feature following specifications
/plan "Add user authentication as specified in requirements"
# AI creates tasks that follow design specs and coding guidelines

# 3. Build with TDD
/build
# Automatically follows tech specs and coding standards

# 4. Comprehensive testing  
/test
# Validates against requirements and performance standards

# 5. Deploy
/ship
# Production deployment following deployment guidelines
```

## 📊 Quality Standards

- **>90% test coverage** with comprehensive edge case testing
- **Security validation** on all inputs and dependencies  
- **Performance benchmarks** must pass
- **TDD methodology** strictly enforced
- **Automatic blocker resolution** before implementation
- **Dependency awareness** with critical path analysis

## 🔔 Alert System

Automatic audio/visual alerts when:
- Manual approval required
- Errors need attention
- Tasks complete successfully
- Workflow gets blocked
- Agent handoffs occur

## 🚦 Quick Commands

```bash
# Check workflow status
cat ./.claude/workflow/current_task.json

# Monitor progress
tail -f ./.claude/logs/autonomous-workflow.log

# Test alert system
./.claude/hooks/user-attention-alert.sh complete "Test message"
```

## 🛠️ Advanced Features

### Autonomous Orchestration
- **Zero Human Intervention**: Runs until completion or unrecoverable failure
- **Intelligent Retry**: Build failures (3 attempts), test failures (2 attempts)
- **Dependency Awareness**: Respects task dependencies automatically
- **Progress Tracking**: Comprehensive logging and status monitoring

### Blocker Resolution
Automatically resolves:
- Missing dependencies and tools
- Environment configuration issues
- Development database setup
- CI/CD pipeline configuration

### Task Format
Every task includes:
- Context & purpose with user value
- Testable success criteria
- TDD implementation plan  
- Risk assessment & definition of done

## 📚 Key Principles for AI Agents

1. **Deep Analysis First** - Always understand before implementing
2. **Break Down Ruthlessly** - No task >4 hours, make them actionable/testable
3. **Test-First Always** - Write failing tests before any code
4. **Resolve Blockers Automatically** - Don't wait for human intervention
5. **Quality Over Speed** - Better to build right once than fix repeatedly
6. **Alert Only When Necessary** - Minimize human interruptions

## 🔄 Migration from Legacy Workflow

If you have an existing project with the old workflow:

1. **Backup current state**
2. **Update .claude/ directory** with new enhanced commands
3. **Run `/project`** to upgrade project configuration
4. **Continue with `/plan`** or `/auto` for new features

---

**Built for autonomous AI development. Quality-driven. Human-optional.**

*This workflow prioritizes thoughtful execution and autonomous quality delivery over rapid feature development.*