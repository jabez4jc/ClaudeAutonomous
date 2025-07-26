# /mcp-check - Essential MCP Server Verification

Ensure all required MCP servers are running for optimal AI-driven development workflow.

## Essential MCP Servers

### Required for All Development Tasks
1. **Context7** - `@upstash/context7`
   - **Purpose**: Up-to-date code documentation and framework guidance
   - **Usage**: Real-time access to current framework docs, API references, best practices
   - **Verification**: `context7 --status`

2. **Playwright** - `@microsoft/playwright-mcp`
   - **Purpose**: Browser automation for UI testing and validation
   - **Usage**: Automated testing, screenshot capture, user interaction simulation
   - **Verification**: `playwright --version`

3. **Serena** - `@oraios/serena`
   - **Purpose**: Codebase indexing and intelligent code navigation
   - **Usage**: Code analysis, pattern detection, dependency mapping
   - **Verification**: `serena status`

4. **shadcn-ui** - `@jpisnice/shadcn-ui-mcp-server`
   - **Purpose**: Access to shadcn/ui v4 components, blocks, and metadata
   - **Usage**: Component selection, implementation patterns, design system
   - **Verification**: `shadcn-ui --health`

5. **Desktop Commander** - `@wonderwhy-er/desktop-commander-mcp`
   - **Purpose**: File management and terminal command execution
   - **Usage**: Advanced file operations, system integration, command execution
   - **Verification**: `desktop-commander ping`

## Auto-Verification Process

### Before Each Workflow Command
```bash
# Automatically run before /auto, /plan, /build, /test
/mcp-check

# Verification steps:
1. Check MCP server status
2. Restart failed servers
3. Verify connectivity
4. Report readiness status
```

### MCP Server Health Check
```bash
# Check all essential servers
/mcp-check --all

# Check specific server
/mcp-check context7
/mcp-check playwright
/mcp-check serena
/mcp-check shadcn-ui
/mcp-check desktop-commander
```

## Installation Commands

### Install All Essential MCPs
```bash
# Install all required MCP servers
npm install -g @upstash/context7
npm install -g @microsoft/playwright-mcp
npm install -g @oraios/serena
npm install -g @jpisnice/shadcn-ui-mcp-server
npm install -g @wonderwhy-er/desktop-commander-mcp

# Initialize and start servers
context7 init
playwright install
serena index
shadcn-ui init
desktop-commander start
```

## Integration with Workflow Commands

### Enhanced Planning with MCPs
- **Context7**: Framework documentation analysis
- **Serena**: Existing codebase pattern analysis
- **shadcn-ui**: Component availability assessment

### Enhanced Building with MCPs
- **Desktop Commander**: File operations and project setup
- **shadcn-ui**: Component implementation
- **Context7**: Real-time documentation lookup

### Enhanced Testing with MCPs
- **Playwright**: Automated UI testing and validation
- **Serena**: Code quality and pattern compliance
- **Context7**: Testing framework documentation

## Error Handling

### Failed MCP Server Recovery
```bash
# Auto-recovery process:
1. Detect failed MCP server
2. Attempt restart with default configuration
3. Reinstall if restart fails
4. Report status and continue with available servers
5. Warn about reduced functionality
```

### Reduced Functionality Mode
If essential MCP servers are unavailable:
- **Context7 offline**: Use cached documentation, warn about potentially outdated info
- **Playwright offline**: Skip automated UI tests, use manual validation prompts
- **Serena offline**: Use basic file operations, reduced code intelligence
- **shadcn-ui offline**: Use generic UI components, manual component selection
- **Desktop Commander offline**: Use basic file operations, reduced system integration

## Expected Output

### Successful Verification
```bash
/mcp-check
✅ Context7: Active (v2.1.0) - Framework docs ready
✅ Playwright: Active (v1.40.0) - Browser automation ready  
✅ Serena: Active (v1.2.0) - Codebase indexed (1,247 files)
✅ shadcn-ui: Active (v4.0.0) - 89 components available
✅ Desktop Commander: Active (v1.1.0) - System integration ready
🚀 All essential MCP servers operational - Workflow ready
```

### Partial Failure
```bash
/mcp-check
✅ Context7: Active
❌ Playwright: Failed to connect
✅ Serena: Active  
✅ shadcn-ui: Active
✅ Desktop Commander: Active
⚠️ Reduced functionality: UI automation disabled
🔄 Attempting Playwright restart...
```