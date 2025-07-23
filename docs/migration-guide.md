# Migration Guide: Updating Existing Projects

This guide helps you update existing AI-driven workflow projects with the latest enhancements.

## 🔄 What's New in This Update

- **Enhanced Planning**: `/plan --complete` and `/plan-continue` commands
- **Continuous Execution**: `/auto --continuous` with automatic task progression
- **Task Lifecycle Management**: Automatic folder movement through `backlog → in-progress → testing → completed`
- **Improved Monitoring**: Real-time project status and enhanced logging
- **Portable Configuration**: Relative paths in settings for cross-project compatibility

## 📋 Pre-Migration Checklist

Before updating, ensure you have:
- [ ] Current project backed up
- [ ] All work-in-progress committed to git
- [ ] No tasks currently in progress that would be disrupted

## 🚀 Migration Steps

### Step 1: Backup Current State
```bash
# Create backup branch
git checkout -b backup-before-migration
git push origin backup-before-migration

# Return to main branch
git checkout main
```

### Step 2: Update .claude Directory Structure

#### 2.1 Update Command Files
Copy the enhanced command files from this template:

```bash
# From the new template directory, copy enhanced commands
cp /path/to/ClaudeAutonomous/.claude/commands/plan.md .claude/commands/
cp /path/to/ClaudeAutonomous/.claude/commands/auto.md .claude/commands/

# Add new commands
cp /path/to/ClaudeAutonomous/.claude/commands/plan-continue.md .claude/commands/
```

Or manually create the missing command file:

<details>
<summary>Click to see /plan-continue command content</summary>

```bash
cat > .claude/commands/plan-continue.md << 'EOF'
# /plan-continue - Continue Task Planning

## Purpose
Continue generating detailed tasks from previous planning analysis summaries and add them to the backlog for development.

## Core Philosophy
**Ultra Think before you build and you won't break anything**

Continue the deep thinking process by expanding analysis summaries into actionable tasks.

## Process

### 1. Analysis Review
- Read existing analysis summaries from previous `/plan` sessions
- Review incomplete task breakdowns
- Identify areas needing detailed task creation

### 2. Task Generation from Summaries
- Convert analysis summaries into specific, actionable tasks
- Break down complex features into <4 hour tasks
- Maintain consistency with existing task format
- Ensure dependency tracking between tasks

### 3. Task Creation Pipeline
- Create detailed task files in `tasks/backlog/`
- Each task includes:
  - Clear description and context
  - Success criteria checklist
  - Technical implementation notes
  - Dependencies on other tasks
  - Estimated complexity/effort

### 4. Integration with Existing Workflow
- Update project status with new task counts
- Maintain task numbering sequence
- Link tasks to original analysis summaries
- Prepare tasks for `/auto` command pickup

## Expected Outcome
- All remaining tasks from analysis summaries are created as actionable items
- Tasks are properly organized in backlog with clear dependencies
- Ready for sequential development using `/auto` command
- Project maintains momentum without planning bottlenecks
EOF
```
</details>

#### 2.2 Update Settings for Portability
```bash
# Check current settings
cat .claude/settings.local.json

# Update paths to be relative (if they're absolute)
# Change any paths like "/full/path/to/project/.claude/hooks/..."
# To relative paths like ".claude/hooks/..."
```

#### 2.3 Add Supporting Scripts
```bash
# Create scripts directory
mkdir -p .claude/scripts

# Add continuous processing script (optional - for manual testing)
cp /path/to/ClaudeAutonomous/.claude/scripts/continuous-auto.sh .claude/scripts/
chmod +x .claude/scripts/continuous-auto.sh
```

### Step 3: Update Project Structure

#### 3.1 Ensure Task Folder Structure
```bash
# Create missing task folders if they don't exist
mkdir -p tasks/{analysis,backlog,in-progress,testing,completed}

# Add .gitkeep files to preserve empty folders
touch tasks/analysis/.gitkeep
touch tasks/in-progress/.gitkeep
touch tasks/testing/.gitkeep
touch tasks/completed/.gitkeep
```

#### 3.2 Migrate Existing Tasks
If you have tasks in old locations, organize them:

```bash
# Move any existing tasks to appropriate folders
# Example: move planned tasks to backlog
find tasks/ -name "*.md" -not -path "*/backlog/*" -not -path "*/completed/*" -exec mv {} tasks/backlog/ \;

# Or manually organize based on current status:
# - Planned/ready tasks → tasks/backlog/
# - Currently working on → tasks/in-progress/
# - Ready for testing → tasks/testing/
# - Fully complete → tasks/completed/
```

### Step 4: Initialize Project Status Tracking

```bash
# Create project status file
cat > .claude/project_status.json << EOF
{
  "project": "$(basename $(pwd))",
  "last_updated": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "tasks": {
    "backlog": $(find tasks/backlog -name "*.md" 2>/dev/null | wc -l),
    "in_progress": $(find tasks/in-progress -name "*.md" 2>/dev/null | wc -l),
    "testing": $(find tasks/testing -name "*.md" 2>/dev/null | wc -l),
    "completed": $(find tasks/completed -name "*.md" 2>/dev/null | wc -l)
  },
  "workflow_state": "ready"
}
EOF
```

### Step 5: Test the Migration

#### 5.1 Verify Command Availability
```bash
# Test new commands are available
/plan-continue --help  # Should show usage info or execute if available
```

#### 5.2 Test Task Processing
```bash
# Check current project status
cat .claude/project_status.json

# View task distribution
find tasks/ -name "*.md" | sort

# Test auto command enhancements (if tasks available)
/auto  # Should process next available task from backlog
```

### Step 6: Update Documentation (Optional)

If you have project-specific documentation:

```bash
# Update any project README or docs that reference the old workflow
# Add references to new commands:
# - /plan --complete
# - /plan-continue  
# - /auto --continuous
```

## 🧪 Verification Steps

After migration, verify everything works:

### 1. Planning Enhancements
```bash
# Test enhanced planning (if starting new work)
/plan --complete    # Should create comprehensive task breakdown
# OR
/plan              # Should create initial tasks + analysis summary
/plan-continue     # Should expand remaining tasks from analysis
```

### 2. Continuous Execution
```bash
# Test continuous task processing (if tasks in backlog)
/auto --continuous  # Should process tasks sequentially with folder movement
```

### 3. Status Monitoring
```bash
# Monitor real-time status
tail -f .claude/logs/autonomous-workflow.log

# Check project status updates
cat .claude/project_status.json
```

## 🔧 Troubleshooting

### Common Issues

#### Issue: Commands not found
**Solution**: Ensure command files exist in `.claude/commands/` with correct names

#### Issue: Tasks not moving between folders
**Solution**: Verify folder structure exists and AI agent has write permissions

#### Issue: Status file not updating
**Solution**: Check `.claude/project_status.json` exists and is writable

#### Issue: Relative paths not working
**Solution**: Verify `.claude/settings.local.json` uses relative paths like `.claude/hooks/...`

### Getting Help

If you encounter issues:

1. **Check the logs**: `tail -f .claude/logs/autonomous-workflow.log`
2. **Verify folder structure**: `find tasks/ -type d`
3. **Test basic commands**: `/plan` (should work in any migrated project)
4. **Review settings**: `cat .claude/settings.local.json`

## 📈 Benefits After Migration

Once migrated, you'll have access to:

✅ **Complete Planning**: Create all tasks upfront with `/plan --complete`
✅ **Continuous Execution**: Autonomous task processing with `/auto --continuous`
✅ **Automatic Task Management**: Tasks move through lifecycle automatically
✅ **Enhanced Monitoring**: Real-time status tracking and comprehensive logging
✅ **Improved Workflow**: Reduced manual intervention and better task organization

## 🎯 Next Steps

After successful migration:

1. **Use Enhanced Planning**: Try `/plan --complete` for your next feature
2. **Test Continuous Mode**: Use `/auto --continuous` to process your backlog
3. **Monitor Progress**: Set up monitoring with the new status tracking
4. **Optimize Workflow**: Adjust task organization based on the new folder structure

Your project is now ready for enhanced autonomous development! 🚀