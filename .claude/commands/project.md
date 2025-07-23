# /project - Project Initialization

"Ultra Think before you build" - Initialize projects with deep analysis, intelligent tech stack selection, and comprehensive planning.

## Required Info
1. **Project Name** - Descriptive name
2. **Project Type** - Select from types below
3. **Primary Language** - Auto-populated (customizable)

## Application Types

### 🌐 Web Applications

**Full-Stack Web App**
- **A**: Next.js 14+ + shadcn/ui + Prisma + PostgreSQL
- **B**: React + Node.js + TypeScript + TanStack Query  
- **C**: Vue.js + Python FastAPI + SQLAlchemy
- **D**: SvelteKit + Drizzle ORM + TypeScript
- **E**: React + Go + Gin + GORM
- **F**: Custom Stack (Interactive Builder)

**SPA**: React/Vue + TypeScript + Vite
**SSR**: Next.js/Nuxt.js + TypeScript + Prisma
**Static**: HTML/CSS/JS + Astro/11ty + Tailwind

### 📱 Mobile Apps
**Native iOS**: Swift/SwiftUI + Xcode + Core Data
**Native Android**: Kotlin + Jetpack Compose + Room  
**Cross-Platform**: React Native/Flutter + TypeScript/Dart

### 🔌 APIs & Backend
**REST API**: Python FastAPI or Node.js Express + PostgreSQL
**GraphQL**: Apollo Server + TypeScript + schema-first
**Microservices**: Docker + Kubernetes + gRPC/REST

### 🛠️ Tools & Utilities  
**CLI**: Python Click or Go Cobra + rich features
**Desktop**: Electron/Tauri + React/Vue + native APIs
**Browser Extension**: TypeScript + WebExtensions + React

### 📚 Libraries
**JS/TS Library**: TypeScript + Rollup/Vite + Jest/Vitest
**Python Package**: Python + UV + pytest + type hints
**Framework/SDK**: Language-specific + comprehensive tooling

### 🎯 Specialized
**E-commerce**: Next.js + Stripe + PostgreSQL + Redis
**CMS**: Headless CMS + Frontend + rich editor
**Analytics**: React/D3.js + Python/Pandas + ETL
**ML App**: Python FastAPI + TensorFlow/PyTorch + MLflow

## Key Features
- **Deep Thinking**: Comprehensive problem analysis before implementation
- **TDD Approach**: Red-Green-Refactor cycle with >90% coverage
- **Auto Blockers**: Detects and resolves missing dependencies
- **Granular Tasks**: <4hr micro-tasks with clear acceptance criteria

## Custom Tech Stack (Option F)
Interactive builder for:
- **Frontend**: React, Vue, Angular, Svelte + UI libraries
- **Backend**: Node.js, Python, Go, Java, Rust + frameworks  
- **Database**: PostgreSQL, MongoDB, Redis + ORMs
- **Auth**: OAuth, JWT, session-based strategies
- **Tools**: Testing, build tools, deployment platforms

## Workflow
```bash
./.claude/workflow/init_project.sh "PROJECT_NAME" "PROJECT_TYPE"
```

Process: Deep analysis → Architecture design → Environment setup → Task planning → TDD setup → CI/CD pipeline

## Actions
1. Initialize new project
2. Custom tech stack builder  
3. Check project status
4. List active tasks
5. Run blocker detection