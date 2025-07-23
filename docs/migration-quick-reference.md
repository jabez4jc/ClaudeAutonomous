# Migration Quick Reference

## 🚀 Automated Migration (Recommended)

```bash
# 1. Navigate to your existing project
cd /path/to/your/existing/project

# 2. Run automated migration script
/path/to/ClaudeAutonomous/.claude/scripts/migrate-project.sh /path/to/ClaudeAutonomous

# 3. Verify migration
cat .claude/project_status.json
find tasks/ -name "*.md" | sort
```

## 🔧 Manual Migration (Step-by-Step)

### Quick Setup
```bash
# Backup current state
git checkout -b backup-before-migration
git add . && git commit -m "Backup before migration"
git checkout main

# Update folder structure
mkdir -p tasks/{analysis,backlog,in-progress,testing,completed}
touch tasks/{in-progress,testing}/.gitkeep

# Move existing tasks to backlog
find tasks/ -name "*.md" -not -path "*/backlog/*" -not -path "*/completed/*" -exec mv {} tasks/backlog/ \;
```

### Essential Files to Copy
```bash
# From the enhanced template, copy these files:
cp /template/.claude/commands/plan.md .claude/commands/
cp /template/.claude/commands/auto.md .claude/commands/  
cp /template/.claude/commands/plan-continue.md .claude/commands/
cp /template/.claude/scripts/continuous-auto.sh .claude/scripts/
chmod +x .claude/scripts/continuous-auto.sh
```

### Update Settings
```bash
# Edit .claude/settings.local.json
# Change absolute paths to relative paths:
# "/full/path/.claude/hooks/file.sh" → ".claude/hooks/file.sh"
```

## ✅ Verification Checklist

After migration, verify:
- [ ] Task folders exist: `ls tasks/`  
- [ ] Project status created: `cat .claude/project_status.json`
- [ ] Enhanced commands available: `/plan-continue` should work
- [ ] Settings use relative paths: `grep "claude/hooks" .claude/settings.local.json`

## 🎯 Test New Features

```bash
# Test enhanced planning
/plan --complete        # Creates all tasks upfront

# Test iterative planning  
/plan                   # Initial tasks
/plan-continue          # Remaining tasks

# Test continuous execution
/auto --continuous      # Process entire backlog
```

## 🆘 Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| Commands not found | Copy command files to `.claude/commands/` |
| Tasks not moving | Check folder permissions and structure |
| Settings errors | Update paths to relative in `settings.local.json` |
| Status not updating | Recreate `.claude/project_status.json` |

## 📞 Need Help?

1. **Check logs**: `tail -f .claude/logs/autonomous-workflow.log`
2. **Review guide**: `docs/migration-guide.md`
3. **Test basic commands**: `/plan` should always work
4. **Verify structure**: `find .claude/ -type f` to see all files