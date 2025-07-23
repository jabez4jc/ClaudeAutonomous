#!/bin/bash
# Initialize a new AI-driven development project (simplified)

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Get project root
PROJECT_ROOT="$(pwd)"

echo -e "${BLUE}🚀 Project Initialization${NC}"
echo "======================"

# Get project name
if [ -z "$1" ]; then
    echo -e "${YELLOW}Project Name:${NC}"
    read -r PROJECT_NAME
    while [ -z "$PROJECT_NAME" ]; do
        echo "Project name required:"
        read -r PROJECT_NAME
    done
else
    PROJECT_NAME="$1"
fi

# Get project type
echo -e "\n${YELLOW}Project Type:${NC}"
echo "1) API"
echo "2) Web App"
echo "3) CLI Tool"
echo "4) Library"
echo "5) Other"
read -p "Select [1-5]: " PROJECT_TYPE_NUM

case $PROJECT_TYPE_NUM in
    1) PROJECT_TYPE="API" ;;
    2) PROJECT_TYPE="Web App" ;;
    3) PROJECT_TYPE="CLI Tool" ;;
    4) PROJECT_TYPE="Library" ;;
    *) PROJECT_TYPE="General" ;;
esac

# Get primary language
echo -e "\n${YELLOW}Primary Language:${NC}"
echo "1) Python"
echo "2) JavaScript/TypeScript"
echo "3) Go"
echo "4) Rust"
echo "5) Other"
read -p "Select [1-5]: " LANG_NUM

case $LANG_NUM in
    1) PRIMARY_LANG="Python" ;;
    2) PRIMARY_LANG="JavaScript" ;;
    3) PRIMARY_LANG="Go" ;;
    4) PRIMARY_LANG="Rust" ;;
    *) PRIMARY_LANG="General" ;;
esac

# Create directory structure
echo -e "\n${GREEN}Creating project structure...${NC}"
mkdir -p "$PROJECT_ROOT"/{docs,src,tests}
mkdir -p "$PROJECT_ROOT"/tasks/{backlog,in-progress,completed}
mkdir -p "$PROJECT_ROOT"/.claude/logs

# Create project status
cat > "$PROJECT_ROOT/.claude/project_status.json" << EOF
{
  "project": "$PROJECT_NAME",
  "type": "$PROJECT_TYPE",
  "language": "$PRIMARY_LANG",
  "created": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "current_task": null,
  "tasks_completed": 0,
  "active": true
}
EOF

# Create initial README
cat > "$PROJECT_ROOT/README.md" << EOF
# $PROJECT_NAME

**Type**: $PROJECT_TYPE  
**Language**: $PRIMARY_LANG  
**Created**: $(date +"%B %d, %Y")

## Overview

Built using AI-driven development workflow.

## Quick Start

1. Define tasks: \`/plan\`
2. Build features: \`/build\`
3. Test thoroughly: \`/test\`
4. Deploy: \`/ship\`

## Project Structure

\`\`\`
tasks/
  backlog/     # Planned work
  in-progress/ # Current work
  completed/   # Finished work
docs/          # Documentation
src/           # Source code
tests/         # Test files
\`\`\`

## Development Workflow

This project follows:
- Test-driven development
- 80% code coverage minimum
- Security-first approach
- Continuous deployment

EOF

# Set up language-specific environment
if [ "$PRIMARY_LANG" = "Python" ]; then
    echo -e "\n${GREEN}Setting up Python environment...${NC}"
    if command -v uv &> /dev/null; then
        uv init --no-readme
        uv add --dev pytest pytest-cov black ruff mypy
        echo -e "${GREEN}✅ UV environment created${NC}"
    else
        echo -e "${YELLOW}Install UV for better Python package management:${NC}"
        echo "curl -LsSf https://astral.sh/uv/install.sh | sh"
    fi
elif [ "$PRIMARY_LANG" = "JavaScript" ]; then
    echo -e "\n${GREEN}Setting up Node.js environment...${NC}"
    npm init -y
    npm install --save-dev jest eslint prettier
    echo -e "${GREEN}✅ Node environment created${NC}"
elif [ "$PRIMARY_LANG" = "Go" ]; then
    echo -e "\n${GREEN}Setting up Go environment...${NC}"
    go mod init "$PROJECT_NAME"
    echo -e "${GREEN}✅ Go module initialized${NC}"
fi

# Create first task template
cat > "$PROJECT_ROOT/tasks/backlog/001-initial-setup.md" << EOF
# Task: Initial Project Setup

## Description
Set up the basic project structure and implement a minimal working version.

## Success Criteria
- [ ] Basic project structure created
- [ ] Main entry point implemented
- [ ] Basic tests written
- [ ] README updated with usage instructions
- [ ] All tests passing

## Technical Notes
- Follow ${PRIMARY_LANG} best practices
- Ensure 80% test coverage
- Add appropriate error handling
EOF

echo -e "\n${GREEN}✅ Project initialized successfully!${NC}"
echo -e "\n${BLUE}Next Steps:${NC}"
echo "1. Review the initial task in tasks/backlog/"
echo "2. Use /plan to create more tasks"
echo "3. Use /build to start implementation"
echo "4. Use /test to verify quality"
echo "5. Use /ship when ready to deploy"
echo -e "\n${YELLOW}Simplified workflow: Plan → Build → Test → Ship${NC}"