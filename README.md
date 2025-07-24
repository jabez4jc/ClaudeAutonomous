# AI-Driven Development Workflow

> **"Ultra Think before you build and you won't break anything"**

A streamlined, autonomous development workflow where AI agents prioritize **deep thinking**, **prevention over fixing**, and **intelligent automation** over rapid delivery.

## 🚀 Quick Start

```bash
# 1. Setup MCP servers (one-time)
/setup-mcp

# 2. Feedback-driven development (recommended)
/plan --complete         # Create all tasks upfront
/auto --interactive      # Interactive mode for frontend tasks  
/auto                    # Default mode for backend tasks
/auto --silent           # Silent mode for utilities

# 3. Smart continuous development
/plan                    # Initial planning (3-5 primary tasks)
/auto --continuous       # Processes backlog with appropriate feedback modes
/plan-continue           # Generate remaining tasks from summaries
/auto --continuous       # Continue with smart feedback adaptation

# 4. Step-by-step approach
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

### What's New ✨
- **🤖 Fully Autonomous Workflow** - `/auto` command handles everything
- **⚡ Continuous Task Processing** - `/auto --continuous` processes entire backlog automatically
- **📋 Enhanced Planning Options** - `/plan --complete` creates all tasks upfront, `/plan-continue` generates remaining tasks
- **🔄 Automatic Task Management** - Tasks move through `backlog → in-progress → testing → completed` automatically
- **🧠 Deep Thinking Planning** - 30-45 minute analysis phases (standard) or 45-60 minute complete planning
- **📱 15+ Application Types** - Web apps, mobile, APIs, CLIs with auto tech stacks
- **🔗 Dependency Mapping** - Comprehensive analysis of all dependencies
- **🚧 Smart Blocker Detection** - Identifies and resolves blockers automatically
- **🧪 Strict TDD** - Red-Green-Refactor methodology enforced
- **📊 90%+ Test Coverage** - Comprehensive validation requirements
- **🔔 Alert System** - Audio/visual alerts when attention needed
- **🔌 MCP Integration** - Enhanced with 9 essential servers: Memory Bank, GitHub, Database, Puppeteer, Context7, and more

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
| `/setup-mcp` | MCP server installation | One-time setup of 9 essential MCP servers |
| `/project` | Intelligent project setup | 15+ app types, auto tech stacks, custom builder |
| `/plan` | Deep thinking planning | Problem analysis, dependency mapping, blocker detection, MCP enhanced |
| `/plan --complete` | Complete task planning | Create ALL tasks in one session (45-60 min) |
| `/plan-continue` | Continue planning | Generate remaining tasks from analysis summaries |
| `/build` | TDD implementation | Red-Green-Refactor, auto-approval, quality gates, MCP enhanced |
| `/test` | Comprehensive validation | 90%+ coverage, security, performance, auto-retry, MCP enhanced |
| `/dev` | **Development server management** | **Unified start/stop for frontend + backend with automatic port cleanup** |
| `/ship` | Production deployment | Monitoring, rollback, documentation, MCP enhanced |
| `/auto` | **Feedback-driven workflow** | **Task execution with human checkpoints (2-3 per task)** |
| `/auto --interactive` | **Interactive frontend development** | **High-frequency feedback with visual previews (4-6 per task)** |
| `/auto --continuous` | **Smart continuous execution** | **Process entire backlog with context-appropriate feedback** |
| `/auto --silent` | **Fully autonomous workflow** | **Zero-interruption execution for utilities and infrastructure** |

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

## 🧠 Deep Thinking Process (MCP Enhanced)

Every `/plan` command includes:

1. **Documentation Reading** (First step - analyze docs/ + Context7 MCP for framework docs)
2. **Problem Analysis** (30-45 minutes comprehensive analysis with Memory Bank MCP)
3. **Multiple Solution Evaluation** (2-3 approaches considered using GitHub MCP analysis)
4. **Dependency Mapping** (internal/external dependencies with Database MCP)
5. **Blocker Classification** (technical, resource, knowledge, process)
6. **Critical Path Analysis** (task dependency graphs with Sequential Thinking MCP)
7. **Granular Breakdown** (every task <4 hours, actionable)

## 🧪 Test-Driven Development (Mandatory)

1. **Red Phase**: Write failing tests first
2. **Green Phase**: Implement minimal code to pass tests
3. **Refactor Phase**: Improve code while keeping tests green
4. **Coverage**: Maintain >90% test coverage
5. **Auto-retry**: Failed tests trigger build phase fixes

## 🔌 MCP Integration

This workflow is enhanced with 9 essential MCP servers for autonomous development:

### Core MCP Servers
- **🧠 Memory Bank MCP**: Preserve insights and architectural decisions across sessions
- **🐙 GitHub MCP**: Repository analysis, PR automation, CI/CD integration
- **🎯 Sequential Thinking MCP**: Enhanced problem breakdown for planning phase
- **🗄️ Database MCP**: Schema analysis and migration automation
- **🤖 Puppeteer MCP**: Automated E2E testing and web interaction
- **📁 File System MCP**: Enhanced file operations and structure creation
- **📋 Notion MCP**: Documentation and requirements management
- **🎨 Figma MCP**: Design-to-code workflow integration
- **📚 Context7 MCP**: Tech documentation understanding and framework guidance

### Setup (One-time)
```bash
/setup-mcp  # Installs all 9 MCP servers automatically
```

## 🔧 Dependency Management & Auto-Approved Commands

### 📦 Project-Isolated Dependencies (Required)
**All application dependencies MUST be contained within the project directory. No global installations.**

#### Python Backend - Use Astral UV
```bash
# ✅ Auto-approved (project-isolated)
uv add fastapi uvicorn          # Add runtime dependencies
uv add --dev pytest black      # Add development dependencies  
uv run python main.py          # Run in isolated environment
uv sync                         # Install all dependencies

# ❌ Requires approval (global/system)
pip install fastapi            # Global installation
sudo pip install package      # System-level installation
```

#### Frontend - Use Local Package Managers
```bash
# ✅ Auto-approved (project-local)
pnpm add react typescript      # Preferred: fastest package manager
yarn add react typescript     # Alternative: good performance
npm install react typescript  # Fallback: widely supported
npx create-next-app           # Run tools from local packages

# ❌ Requires approval (global)
npm install -g typescript     # Global installation
yarn global add package       # Global installation
```

### Auto-Approved Commands
- **Package Managers (Local)**: `uv add`, `uv run`, `pnpm add`, `yarn add`, `npm install`, `npx`
- **Development**: `python`, `node`, `go`, `tsc`, `pytest`, `jest`
- **Version Control**: `git status`, `git add`, `git commit`, `git diff`
- **File Operations**: `mkdir`, `touch`, `cp`, `mv`, `chmod`
- **Utilities**: `curl`, `echo`, `cat`, `grep`, `find`, `ls`
- **Servers**: `uvicorn`, `gunicorn`, `flask run`

See `docs/guidelines/dependency-management.md` for comprehensive guidelines.

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

## 🔄 Enhanced Workflow Options

### Feedback-Driven Development Modes

#### Interactive Mode (`/auto --interactive`) - Frontend Focus
**Best For**: UI components, pages, styling, user interactions, design-heavy tasks
**Feedback Frequency**: 4-6 checkpoints per task
**Includes**: 
- Live preview generation and screenshots
- Design mockup comparisons  
- Accessibility testing results
- Cross-browser compatibility checks
- Real-time style guide compliance

```bash
/auto --interactive "Create responsive product catalog with filters"
# Checkpoints: Component structure → Layout design → Filter functionality → Mobile responsive → Final review
```

#### Default Mode (`/auto`) - Balanced Approach  
**Best For**: General development, APIs, business logic, mixed frontend/backend
**Feedback Frequency**: 2-3 checkpoints per task
**Includes**:
- Implementation approach approval
- Functional testing and validation
- Security and performance review

```bash
/auto "Implement user authentication with JWT tokens"
# Checkpoints: API design approval → Implementation demo → Security audit
```

#### Continuous Mode (`/auto --continuous`) - Smart Automation
**Best For**: Processing entire backlog with minimal interruption
**Feedback Frequency**: Context-adaptive (automatically switches modes)
**Includes**:
- Automatic mode selection based on task type
- Interactive mode for frontend tasks
- Default mode for mixed tasks  
- Silent mode for utilities

#### Silent Mode (`/auto --silent`) - Full Automation
**Best For**: Utilities, tests, documentation, refactoring, infrastructure
**Feedback Frequency**: Final review only
**Includes**:
- Comprehensive automated testing
- Extra validation and quality checks
- Detailed completion reports

### Planning Approaches

#### Complete Planning (All Tasks Upfront)
```bash
/plan --complete         # 45-60 min session, creates ALL tasks
/auto --continuous       # Process entire backlog autonomously
```

#### Iterative Planning (Phased Approach)  
```bash
/plan                    # Initial planning (3-5 primary tasks)
/auto                    # Work on first tasks
/plan-continue           # Generate remaining tasks from summaries
/auto --continuous       # Continue autonomous processing
```

### Task Lifecycle Management
Tasks automatically move through folders:
```
tasks/backlog/ → tasks/in-progress/ → tasks/testing/ → tasks/completed/
```

### Autonomous Execution Options
```bash
# Feedback-driven development (recommended for most tasks)
/auto                    # Single task with 2-3 human checkpoints
/auto "specific task"    # Execute specific task with feedback

# Frontend development (high-frequency feedback)  
/auto --interactive      # 4-6 checkpoints with visual previews
/auto --interactive "Create user dashboard with charts"

# Smart continuous processing
/auto --continuous       # Entire backlog with context-appropriate feedback
                        # (Automatically uses interactive mode for frontend tasks)

# Zero-interruption automation
/auto --silent          # Fully autonomous for utilities/infrastructure
/auto --silent "Add unit tests for authentication module"
```

## 🚦 Quick Commands

```bash
# Development server management (single command for full-stack)
/dev start              # Start frontend + backend + services
/dev stop               # Stop all development servers
/dev status             # Show running services and ports
/dev logs               # Combined logs from all services

# Project status and monitoring
cat ./.claude/project_status.json
tail -f ./.claude/logs/autonomous-workflow.log
find tasks/ -name "*.md" | sort

# Manual testing after build completion
/dev start              # Single command starts entire development environment
# Access at: http://localhost:3000 (frontend) + http://localhost:8000/docs (backend API)

# Test alert system
./.claude/hooks/user-attention-alert.sh complete "Test message"

# Run continuous processing script
./.claude/scripts/continuous-auto.sh --continuous
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

## 🔄 Updating Existing Projects

To add the new features to an existing AI-driven workflow project:

```bash
# 1. Navigate to your existing project
cd /path/to/your/existing/project

# 2. Create the enhanced task folder structure
mkdir -p tasks/{analysis,backlog,in-progress,testing,completed}
touch tasks/{in-progress,testing}/.gitkeep

# 3. Move any existing tasks to backlog
mv tasks/*.md tasks/backlog/ 2>/dev/null || true

# 4. Copy enhanced command files from this template
cp /path/to/template/.claude/commands/plan.md .claude/commands/
cp /path/to/template/.claude/commands/auto.md .claude/commands/
cp /path/to/template/.claude/commands/plan-continue.md .claude/commands/

# 5. Update settings.local.json to use relative paths
# Edit .claude/settings.local.json and change:
# "/full/path/.claude/hooks/script.sh" → ".claude/hooks/script.sh"

# 6. Test the enhanced features
/plan --complete      # Complete planning
/auto --continuous    # Continuous execution
```

Your existing project now has enhanced autonomous capabilities!

---

**Built for autonomous AI development. Quality-driven. Human-optional.**

*This workflow prioritizes thoughtful execution and autonomous quality delivery over rapid feature development.*