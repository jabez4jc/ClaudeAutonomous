#!/bin/bash
# Setup MCP servers for AI-driven workflow

echo "🚀 Setting up MCP servers for AI-driven workflow..."
echo "📋 Installing essential MCP servers..."

# Check if claude command is available
if ! command -v claude &> /dev/null; then
    echo "❌ Claude Code not found. Please install Claude Code first."
    exit 1
fi

echo "📁 Installing File System MCP server..."
claude mcp add filesystem -s user -- npx -y @modelcontextprotocol/server-filesystem

echo "🐙 Installing GitHub MCP server..."
claude mcp add github -s user -- npx -y @modelcontextprotocol/server-github

echo "🗄️ Installing PostgreSQL MCP server..."
claude mcp add postgres -s user -- npx -y @modelcontextprotocol/server-postgres

echo "🧠 Installing Memory Bank MCP server..."
claude mcp add memory -s user -- npx -y @modelcontextprotocol/server-memory

echo "🎯 Installing Sequential Thinking MCP server..."
claude mcp add sequential -s user -- npx -y @modelcontextprotocol/server-sequential-thinking

echo "🤖 Installing Puppeteer MCP server..."
claude mcp add puppeteer -s user -- npx -y @modelcontextprotocol/server-puppeteer

echo "📋 Installing Notion MCP server..."
claude mcp add notion -s user -- npx -y @modelcontextprotocol/server-notion

echo "🎨 Installing Figma MCP server..."
claude mcp add figma -s user -- npx -y @modelcontextprotocol/server-figma

echo "📚 Installing Context7 MCP server..."
claude mcp add context7 -s user -- npx -y @context7/mcp-server

echo ""
echo "✅ MCP servers installation complete!"
echo ""
echo "🔍 Verifying installation..."
echo "Run '/mcp' in Claude Code to see all installed servers."
echo ""
echo "📖 See docs/guidelines/mcp-integration-guide.md for usage examples."
echo ""
echo "🧠 Your 'Ultra Think before you build' workflow now has enhanced capabilities:"
echo "  • Memory Bank: Preserve insights across sessions"
echo "  • GitHub: Repository analysis and automation"
echo "  • Sequential Thinking: Enhanced problem breakdown"
echo "  • Database: Schema analysis and migrations"
echo "  • Puppeteer: Automated testing"
echo "  • Notion: Documentation management"
echo "  • Figma: Design-to-code workflow"
echo "  • Context7: Tech documentation understanding"