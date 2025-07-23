# MCP Integration Guide - AI-Driven Workflow

## Overview

Model Context Protocol (MCP) servers enhance the "Ultra Think before you build" philosophy by providing real-time access to external tools and data during the planning and building phases.

## Core MCP Servers for AI Workflow

### Essential Development Servers

#### 1. GitHub MCP Server 🔥
**Purpose**: Seamless repository interaction during planning and building
**Installation**: 
```bash
claude mcp add github -s user -- npx -y @modelcontextprotocol/server-github
```
**Workflow Integration**:
- `/plan` phase: Analyze existing issues, PRs, and codebase structure
- `/build` phase: Create issues, manage PRs, trigger CI/CD
- `/test` phase: Check build status and test results
- `/ship` phase: Create releases and deployment triggers

#### 2. File System MCP Server 📁
**Purpose**: Enhanced file operations during all phases
**Installation**:
```bash
claude mcp add filesystem -s user -- npx -y @modelcontextprotocol/server-filesystem
```
**Workflow Integration**:
- Deep file analysis during planning
- Automated file structure creation
- Project template generation

#### 3. PostgreSQL/Database MCP Server 🗄️
**Purpose**: Database schema analysis and migration planning
**Installation**:
```bash
claude mcp add postgres -s user -- npx -y @modelcontextprotocol/server-postgres
```
**Workflow Integration**:
- `/plan` phase: Analyze existing schema, identify dependencies
- `/build` phase: Generate migrations, seed data
- `/test` phase: Database testing and validation

### Automation & Integration Servers

#### 4. Puppeteer MCP Server 🤖
**Purpose**: Automated testing and web scraping
**Installation**:
```bash
claude mcp add puppeteer -s user -- npx -y @modelcontextprotocol/server-puppeteer
```
**Workflow Integration**:
- End-to-end testing automation
- UI interaction testing
- Performance monitoring

#### 5. Memory Bank MCP Server 🧠
**Purpose**: Context retention across sessions (crucial for "Ultra Think")
**Installation**:
```bash
claude mcp add memory -s user -- npx -y @modelcontextprotocol/server-memory
```
**Workflow Integration**:
- Preserve deep thinking insights across sessions
- Remember architectural decisions and rationale
- Track project evolution and lessons learned

#### 6. Sequential Thinking MCP Server 🎯
**Purpose**: Enhanced problem breakdown (perfect for `/plan` phase)
**Installation**:
```bash
claude mcp add sequential -s user -- npx -y @modelcontextprotocol/server-sequential-thinking
```
**Workflow Integration**:
- Structured problem decomposition
- Dependency analysis enhancement
- Critical path identification

### Design & Documentation Servers

#### 7. Notion MCP Server 📋
**Purpose**: Project documentation and requirement management
**Installation**:
```bash
claude mcp add notion -s user -- npx -y @modelcontextprotocol/server-notion
```
**Workflow Integration**:
- Requirements documentation during `/plan`
- Progress tracking and status updates
- Knowledge base creation

#### 8. Figma MCP Server 🎨
**Purpose**: Design-to-code workflow
**Installation**:
```bash
claude mcp add figma -s user -- npx -y @modelcontextprotocol/server-figma
```
**Workflow Integration**:
- Design analysis during planning
- Component generation during building
- Design system compliance checking

#### 9. Context7 MCP Server 📚
**Purpose**: Tech documentation understanding and analysis
**Installation**:
```bash
claude mcp add context7 -s user -- npx -y @context7/mcp-server
```
**Workflow Integration**:
- Framework documentation analysis during planning
- Best practices research during building
- Testing framework guidance during testing
- Deployment platform documentation during shipping

## Documentation Reading Workflow

### When Documentation is Read

**📋 Planning Phase** - Primary documentation reading:
1. **Local Documentation**: Read `docs/requirements/`, `docs/design/`, `docs/guidelines/`
2. **Framework Docs**: Context7 MCP accesses official framework documentation
3. **External Docs**: Notion MCP retrieves external requirements and specifications
4. **Historical Context**: Memory Bank MCP provides previous project insights

**🔨 Building Phase** - Reference documentation:
- Coding standards and patterns from `docs/guidelines/`
- Framework-specific patterns via Context7 MCP
- Implementation decisions from Memory Bank MCP

**🧪 Testing Phase** - Testing documentation:
- Testing requirements from project docs
- Framework testing patterns via Context7 MCP
- Test patterns from Memory Bank MCP

**🚢 Shipping Phase** - Deployment documentation:
- Deployment specs from `docs/design/`
- Platform documentation via Context7 MCP
- Deployment logs via Notion MCP

## MCP-Enhanced Workflow Commands

### Updated Command Integration

Let me show you how to enhance your existing commands with MCP capabilities:

#### Enhanced /plan Command with MCP
```markdown
## Deep Thinking with MCP Enhancement

**Documentation Reading Phase** (First):
1. Read local `docs/requirements/` for business context
2. Analyze `docs/design/` for technical specifications  
3. Review `docs/guidelines/` for coding standards
4. **Context7 MCP**: Access framework documentation and best practices
5. **Memory Bank MCP**: Retrieve previous architectural decisions
6. **Notion MCP**: Access external requirements and project docs

**Analysis Phase** (Second):
- **GitHub MCP**: Analyze existing codebase structure and open issues  
- **Sequential Thinking MCP**: Break down complex problems systematically
- **Database MCP**: Analyze current schema and identify migration needs
```

#### Enhanced /build Command with MCP
```markdown
## Implementation with MCP Enhancement

**File System**: Automated project structure creation
**GitHub**: PR creation and CI/CD integration
**Database**: Migration generation and execution
**Memory Bank**: Store implementation decisions and patterns
**Context7**: Framework-specific implementation guidance
```

#### Enhanced /test Command with MCP
```markdown
## Testing with MCP Enhancement

**Puppeteer**: Automated E2E testing
**Database**: Database integrity testing
**GitHub**: CI/CD status monitoring
**Memory Bank**: Test pattern storage and retrieval
**Context7**: Testing framework documentation and best practices
```

#### Enhanced /ship Command with MCP
```markdown
## Deployment with MCP Enhancement

**GitHub**: Release creation and deployment triggers
**Notion**: Documentation updates
**Memory Bank**: Deployment lessons learned
**Database**: Production migration execution
**Context7**: Deployment platform documentation and best practices
```

## Installation Script

Create an automated MCP setup script:

```bash
#!/bin/bash
# setup_mcp_servers.sh

echo "🚀 Setting up MCP servers for AI-driven workflow..."

# Essential development servers
claude mcp add github -s user -- npx -y @modelcontextprotocol/server-github
claude mcp add filesystem -s user -- npx -y @modelcontextprotocol/server-filesystem
claude mcp add postgres -s user -- npx -y @modelcontextprotocol/server-postgres

# Automation & integration
claude mcp add puppeteer -s user -- npx -y @modelcontextprotocol/server-puppeteer
claude mcp add memory -s user -- npx -y @modelcontextprotocol/server-memory
claude mcp add sequential -s user -- npx -y @modelcontextprotocol/server-sequential-thinking

# Design & documentation
claude mcp add notion -s user -- npx -y @modelcontextprotocol/server-notion
claude mcp add figma -s user -- npx -y @modelcontextprotocol/server-figma
claude mcp add context7 -s user -- npx -y @context7/mcp-server

echo "✅ MCP servers installed! Use /mcp to verify installation."
echo "🧠 Your AI workflow now has enhanced capabilities!"
```

## Verification and Usage

### Check Installed Servers
```bash
/mcp
```

### Using MCP in Workflow
```bash
# During planning phase
"Analyze the GitHub repository structure and identify architectural patterns using the GitHub MCP server"

# During building phase  
"Use the File System MCP server to create the project structure based on our plan"

# During testing phase
"Run E2E tests using Puppeteer MCP server to validate user workflows"
```

## Best Practices

### 1. Ultra Think Enhancement
- Use **Memory Bank** to preserve deep thinking insights
- Use **Sequential Thinking** for complex problem breakdown
- Use **GitHub** for codebase analysis during planning

### 2. Automation Focus
- Integrate **Puppeteer** for comprehensive testing
- Use **Database MCP** for migration automation
- Leverage **GitHub** for CI/CD integration

### 3. Documentation & Knowledge
- Use **Notion** for requirements and specifications
- Use **Memory Bank** for lessons learned and patterns
- Use **Figma** for design system compliance

## Security Considerations

- MCP servers with `-s user` flag are available across all sessions
- OAuth authentication is handled automatically for supported services
- Local servers (filesystem, memory) run with user permissions
- External services (GitHub, Notion) require proper API tokens

## Troubleshooting

### Common Issues
1. **Server not found**: Verify installation with `/mcp`
2. **Authentication errors**: Check API tokens and permissions
3. **Connection timeouts**: Verify network connectivity

### Debug Commands
```bash
# List all MCP servers
/mcp

# Reinstall specific server
claude mcp remove github -s user
claude mcp add github -s user -- npx -y @modelcontextprotocol/server-github
```

## Future Enhancements

As new MCP servers become available in 2025:
- **AI Code Review MCP**: Automated code quality analysis
- **Performance Monitoring MCP**: Real-time performance tracking
- **Security Scanning MCP**: Automated vulnerability detection
- **API Testing MCP**: Comprehensive API testing workflows

By integrating these MCP servers, your "Ultra Think before you build" workflow becomes significantly more powerful, with real-time access to tools and data that enhance every phase of development.