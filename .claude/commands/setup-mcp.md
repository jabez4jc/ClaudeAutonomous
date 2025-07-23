# /setup-mcp - MCP Server Installation

"Ultra Think before you build" - Enhanced with MCP servers for comprehensive analysis and automation.

## Purpose
Install and configure essential MCP servers to enhance the AI-driven development workflow with external tool integration.

## Installation Process
This command installs 9 essential MCP servers that integrate with each phase of the workflow:

### Core Servers Installed

**🧠 Memory Bank MCP** - Preserve "Ultra Think" insights across sessions
**🐙 GitHub MCP** - Repository analysis, PR automation, CI/CD integration  
**🗄️ PostgreSQL MCP** - Database schema analysis and migration automation
**📁 File System MCP** - Enhanced file operations and structure creation
**🎯 Sequential Thinking MCP** - Enhanced problem breakdown for planning phase
**🤖 Puppeteer MCP** - Automated E2E testing and web interaction
**📋 Notion MCP** - Documentation and requirements management
**🎨 Figma MCP** - Design-to-code workflow integration
**📚 Context7 MCP** - Tech documentation understanding and analysis

## Workflow Integration

### Planning Phase Enhancement
- **Memory Bank**: Retrieve previous architectural decisions
- **GitHub**: Analyze existing codebase structure
- **Sequential Thinking**: Systematic problem breakdown
- **Context7**: Understand framework documentation and best practices

### Building Phase Enhancement  
- **File System**: Automated project structure creation
- **GitHub**: PR creation and CI/CD triggers
- **PostgreSQL**: Migration generation and execution
- **Context7**: Framework-specific implementation guidance

### Testing Phase Enhancement
- **Puppeteer**: Automated E2E testing
- **PostgreSQL**: Database integrity validation
- **GitHub**: CI/CD status monitoring
- **Context7**: Testing framework documentation

### Shipping Phase Enhancement
- **GitHub**: Release creation and deployment triggers
- **Notion**: Documentation updates
- **Memory Bank**: Store deployment lessons learned
- **Context7**: Deployment platform documentation

## Usage
Simply run the slash command:
```
/setup-mcp
```

## Verification
After installation, verify all servers are available:
```
/mcp
```

## What Gets Installed
1. All MCP servers are installed with `-s user` flag (available across all sessions)
2. Latest versions from npm registry
3. Automatic dependency resolution
4. Cross-platform compatibility (macOS, Linux, Windows)

## Troubleshooting
- If installation fails, ensure Node.js and npm are installed
- Check network connectivity for npm package downloads
- Verify Claude Code is properly installed and updated

## Post-Installation
- Use `/mcp` to list all available servers
- See `docs/guidelines/mcp-integration-guide.md` for detailed usage examples
- Each workflow command now has MCP integration capabilities

The MCP servers transform your AI workflow from local-only to a connected, intelligent system that can analyze repositories, manage documentation, preserve context, and automate testing across the entire development lifecycle.