#!/bin/bash

# Project Migration Script
# Updates existing AI-driven workflow projects with latest enhancements

set -e

PROJECT_ROOT="$(pwd)"
TEMPLATE_ROOT="${1:-}"

echo "🔄 AI-Driven Workflow Migration Script"
echo "======================================="

# Verify we're in a project directory
if [ ! -d ".claude" ]; then
    echo "❌ Error: No .claude directory found. Are you in an AI-driven workflow project?"
    exit 1
fi

echo "📍 Project: $(basename "$PROJECT_ROOT")"

# Create backup
echo "💾 Creating backup branch..."
if git rev-parse --git-dir > /dev/null 2>&1; then
    git checkout -b "backup-before-migration-$(date +%Y%m%d-%H%M%S)" 2>/dev/null || true
    git add . 2>/dev/null || true
    git commit -m "Backup before migration to enhanced workflow" 2>/dev/null || true
    git checkout main 2>/dev/null || git checkout master 2>/dev/null || true
    echo "✅ Backup created"
else
    echo "⚠️  No git repository found - backup skipped"
fi

# Update folder structure
echo "📁 Updating task folder structure..."
mkdir -p tasks/{analysis,backlog,in-progress,testing,completed}
touch tasks/analysis/.gitkeep
touch tasks/in-progress/.gitkeep  
touch tasks/testing/.gitkeep
touch tasks/completed/.gitkeep
echo "✅ Folder structure updated"

# Create scripts directory
echo "🔧 Setting up scripts directory..."
mkdir -p .claude/scripts
echo "✅ Scripts directory ready"

# Update settings for relative paths
echo "⚙️  Updating settings for portability..."
if [ -f ".claude/settings.local.json" ]; then
    # Backup original settings
    cp .claude/settings.local.json .claude/settings.local.json.backup
    
    # Update absolute paths to relative paths
    sed -i.bak 's|"[^"]*\.claude/hooks/|".claude/hooks/|g' .claude/settings.local.json
    rm -f .claude/settings.local.json.bak
    echo "✅ Settings updated with relative paths"
else
    echo "⚠️  No settings.local.json found - skipping path updates"
fi

# Initialize project status
echo "📊 Initializing project status tracking..."
BACKLOG_COUNT=$(find tasks/backlog -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
IN_PROGRESS_COUNT=$(find tasks/in-progress -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
TESTING_COUNT=$(find tasks/testing -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
COMPLETED_COUNT=$(find tasks/completed -name "*.md" 2>/dev/null | wc -l | tr -d ' ')

cat > .claude/project_status.json << EOF
{
  "project": "$(basename "$PROJECT_ROOT")",
  "last_updated": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "tasks": {
    "backlog": $BACKLOG_COUNT,
    "in_progress": $IN_PROGRESS_COUNT,
    "testing": $TESTING_COUNT,
    "completed": $COMPLETED_COUNT,
    "total": $((BACKLOG_COUNT + IN_PROGRESS_COUNT + TESTING_COUNT + COMPLETED_COUNT))
  },
  "workflow_state": "migrated",
  "version": "enhanced-v2"
}
EOF
echo "✅ Project status initialized"

# Organize existing tasks
echo "📋 Organizing existing tasks..."
TASK_COUNT=0
for task_file in $(find tasks/ -name "*.md" -not -path "*/backlog/*" -not -path "*/in-progress/*" -not -path "*/testing/*" -not -path "*/completed/*" 2>/dev/null); do
    if [ -f "$task_file" ]; then
        mv "$task_file" tasks/backlog/
        TASK_COUNT=$((TASK_COUNT + 1))
    fi
done

if [ $TASK_COUNT -gt 0 ]; then
    echo "✅ Moved $TASK_COUNT tasks to backlog folder"
else
    echo "ℹ️  No loose tasks found to organize"
fi

# Create enhanced command files if template provided
if [ -n "$TEMPLATE_ROOT" ] && [ -d "$TEMPLATE_ROOT/.claude/commands" ]; then
    echo "📝 Updating command files from template..."
    
    # Copy enhanced commands
    cp "$TEMPLATE_ROOT/.claude/commands/plan.md" .claude/commands/ 2>/dev/null && echo "  ✅ Updated plan.md"
    cp "$TEMPLATE_ROOT/.claude/commands/auto.md" .claude/commands/ 2>/dev/null && echo "  ✅ Updated auto.md"
    cp "$TEMPLATE_ROOT/.claude/commands/plan-continue.md" .claude/commands/ 2>/dev/null && echo "  ✅ Added plan-continue.md"
    
    # Copy scripts
    cp "$TEMPLATE_ROOT/.claude/scripts/continuous-auto.sh" .claude/scripts/ 2>/dev/null && chmod +x .claude/scripts/continuous-auto.sh && echo "  ✅ Added continuous-auto.sh"
    
    echo "✅ Command files updated"
else
    echo "⚠️  Template path not provided - manual command file updates needed"
    echo "   See migration guide for manual steps"
fi

# Final status update
echo "📊 Updating final project status..."
BACKLOG_COUNT=$(find tasks/backlog -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
IN_PROGRESS_COUNT=$(find tasks/in-progress -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
TESTING_COUNT=$(find tasks/testing -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
COMPLETED_COUNT=$(find tasks/completed -name "*.md" 2>/dev/null | wc -l | tr -d ' ')

cat > .claude/project_status.json << EOF
{
  "project": "$(basename "$PROJECT_ROOT")",
  "last_updated": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "tasks": {
    "backlog": $BACKLOG_COUNT,
    "in_progress": $IN_PROGRESS_COUNT,
    "testing": $TESTING_COUNT,
    "completed": $COMPLETED_COUNT,
    "total": $((BACKLOG_COUNT + IN_PROGRESS_COUNT + TESTING_COUNT + COMPLETED_COUNT))
  },
  "workflow_state": "ready",
  "version": "enhanced-v2"
}
EOF

echo ""
echo "🎉 Migration Complete!"
echo "===================="
echo "📊 Project Status:"
echo "   - Backlog: $BACKLOG_COUNT tasks"
echo "   - In Progress: $IN_PROGRESS_COUNT tasks" 
echo "   - Testing: $TESTING_COUNT tasks"
echo "   - Completed: $COMPLETED_COUNT tasks"
echo ""
echo "🚀 Enhanced Features Now Available:"
echo "   - /plan --complete    (Create all tasks upfront)"
echo "   - /plan-continue      (Generate remaining tasks)"
echo "   - /auto --continuous  (Process entire backlog)"
echo ""
echo "🔍 Next Steps:"
echo "   1. Test the migration: cat .claude/project_status.json"
echo "   2. Try enhanced planning: /plan --complete"
echo "   3. Test continuous execution: /auto --continuous"
echo ""
echo "📚 For detailed guidance, see: docs/migration-guide.md"