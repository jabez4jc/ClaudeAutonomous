#!/bin/bash
# Simple project status check

PROJECT_ROOT="$(pwd)"
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}📊 Project Status${NC}"
echo "==============="

# Check if project initialized
if [ -f "$PROJECT_ROOT/.claude/project_status.json" ]; then
    PROJECT_NAME=$(grep -o '"project"[[:space:]]*:[[:space:]]*"[^"]*"' "$PROJECT_ROOT/.claude/project_status.json" | cut -d'"' -f4)
    PROJECT_TYPE=$(grep -o '"type"[[:space:]]*:[[:space:]]*"[^"]*"' "$PROJECT_ROOT/.claude/project_status.json" | cut -d'"' -f4)
    PROJECT_LANG=$(grep -o '"language"[[:space:]]*:[[:space:]]*"[^"]*"' "$PROJECT_ROOT/.claude/project_status.json" | cut -d'"' -f4)
    
    echo -e "Project: ${GREEN}$PROJECT_NAME${NC}"
    echo -e "Type: $PROJECT_TYPE"
    echo -e "Language: $PROJECT_LANG"
else
    echo -e "${RED}❌ No project initialized${NC}"
    echo "Run /project to start"
    exit 1
fi

echo ""
echo -e "${YELLOW}📋 Tasks${NC}"
echo "--------"

# Count tasks
BACKLOG_COUNT=$(ls "$PROJECT_ROOT/tasks/backlog/"*.md 2>/dev/null | wc -l | tr -d ' ')
PROGRESS_COUNT=$(ls "$PROJECT_ROOT/tasks/in-progress/"*.md 2>/dev/null | wc -l | tr -d ' ')
COMPLETED_COUNT=$(ls "$PROJECT_ROOT/tasks/completed/"*.md 2>/dev/null | wc -l | tr -d ' ')

echo "Backlog:     $BACKLOG_COUNT"
echo "In Progress: $PROGRESS_COUNT"
echo "Completed:   $COMPLETED_COUNT"

# Show current task
if [ $PROGRESS_COUNT -gt 0 ]; then
    echo ""
    echo -e "${BLUE}Current Task:${NC}"
    CURRENT_TASK=$(ls "$PROJECT_ROOT/tasks/in-progress/"*.md 2>/dev/null | head -1)
    if [ -f "$CURRENT_TASK" ]; then
        echo "$(basename "$CURRENT_TASK" .md)"
        grep "^## Description" -A 2 "$CURRENT_TASK" | tail -n +2 | head -2
    fi
fi

# Check test coverage if available
echo ""
echo -e "${YELLOW}📈 Quality Metrics${NC}"
echo "-----------------"

if [ -f "coverage.xml" ] || [ -f ".coverage" ]; then
    echo "Test Coverage: Check with test command"
elif [ -f "coverage/coverage-summary.json" ]; then
    echo "Test Coverage: Check coverage report"
else
    echo "Test Coverage: Not yet measured"
fi

# Quick health check
echo ""
echo -e "${YELLOW}🔧 Environment${NC}"
echo "-------------"

if [ "$PROJECT_LANG" = "Python" ] && command -v uv &> /dev/null; then
    echo -e "Python UV: ${GREEN}✓${NC} Installed"
elif [ "$PROJECT_LANG" = "JavaScript" ] && [ -f "package.json" ]; then
    echo -e "Node.js: ${GREEN}✓${NC} Ready"
elif [ "$PROJECT_LANG" = "Go" ] && [ -f "go.mod" ]; then
    echo -e "Go: ${GREEN}✓${NC} Module initialized"
else
    echo -e "Environment: ${YELLOW}Check setup${NC}"
fi

echo ""
echo -e "${BLUE}Next Steps:${NC}"
if [ $BACKLOG_COUNT -eq 0 ] && [ $PROGRESS_COUNT -eq 0 ]; then
    echo "- Use /plan to create tasks"
elif [ $PROGRESS_COUNT -eq 0 ]; then
    echo "- Use /build to start next task"
elif [ $PROGRESS_COUNT -gt 0 ]; then
    echo "- Continue with /build or /test"
fi