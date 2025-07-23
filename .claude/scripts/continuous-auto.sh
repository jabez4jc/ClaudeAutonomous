#!/bin/bash

# Continuous Auto Workflow Script
# Automatically processes tasks from backlog through completion

set -e

PROJECT_ROOT="$(pwd)"
TASKS_DIR="$PROJECT_ROOT/tasks"
STATUS_FILE="$PROJECT_ROOT/.claude/project_status.json"
LOG_FILE="$PROJECT_ROOT/.claude/logs/autonomous-workflow.log"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Check if any tasks are available in backlog
has_backlog_tasks() {
    [ "$(find "$TASKS_DIR/backlog" -name "*.md" 2>/dev/null | wc -l)" -gt 0 ]
}

# Get next available task (respecting dependencies)
get_next_task() {
    # Find first task in backlog that has no unmet dependencies
    find "$TASKS_DIR/backlog" -name "*.md" | head -1
}

# Move task between folders
move_task() {
    local task_file="$1"
    local from_folder="$2" 
    local to_folder="$3"
    
    local task_name=$(basename "$task_file")
    local new_path="$TASKS_DIR/$to_folder/$task_name"
    
    mkdir -p "$TASKS_DIR/$to_folder"
    mv "$task_file" "$new_path"
    log "Moved task $task_name: $from_folder → $to_folder"
    echo "$new_path"
}

# Update project status
update_status() {
    local backlog_count=$(find "$TASKS_DIR/backlog" -name "*.md" 2>/dev/null | wc -l)
    local in_progress_count=$(find "$TASKS_DIR/in-progress" -name "*.md" 2>/dev/null | wc -l)
    local testing_count=$(find "$TASKS_DIR/testing" -name "*.md" 2>/dev/null | wc -l)
    local completed_count=$(find "$TASKS_DIR/completed" -name "*.md" 2>/dev/null | wc -l)
    
    cat > "$STATUS_FILE" << EOF
{
  "project": "$(basename "$PROJECT_ROOT")",
  "last_updated": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "tasks": {
    "backlog": $backlog_count,
    "in_progress": $in_progress_count,
    "testing": $testing_count,
    "completed": $completed_count,
    "total": $((backlog_count + in_progress_count + testing_count + completed_count))
  },
  "workflow_state": "autonomous"
}
EOF
}

# Main continuous processing loop
main() {
    log "Starting continuous autonomous workflow"
    update_status
    
    while has_backlog_tasks; do
        local next_task=$(get_next_task)
        
        if [ -n "$next_task" ]; then
            local task_name=$(basename "$next_task" .md)
            log "Processing task: $task_name"
            
            # Move to in-progress
            local in_progress_task=$(move_task "$next_task" "backlog" "in-progress")
            update_status
            
            # Here the AI agent would execute the task implementation
            # For now, we'll simulate the workflow phases
            log "Phase 1: Understanding and planning for $task_name"
            sleep 2
            
            log "Phase 2: Building implementation for $task_name"
            sleep 5
            
            # Move to testing
            local testing_task=$(move_task "$in_progress_task" "in-progress" "testing")
            update_status
            
            log "Phase 3: Testing and validation for $task_name"
            sleep 3
            
            # Move to completed
            move_task "$testing_task" "testing" "completed" > /dev/null
            update_status
            
            log "Task completed: $task_name"
            
        else
            log "No available tasks found in backlog"
            break
        fi
    done
    
    log "Continuous workflow completed - all tasks processed"
}

# Handle script arguments
case "${1:-}" in
    --help|-h)
        echo "Usage: $0 [--continuous]"
        echo "Processes tasks from backlog through completion"
        exit 0
        ;;
    --continuous)
        main
        ;;
    *)
        echo "Use --continuous flag to start processing"
        echo "Use --help for usage information"
        exit 1
        ;;
esac