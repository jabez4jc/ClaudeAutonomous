#!/bin/bash
# Hook to detect agent commands and provide context

USER_PROMPT="$1"

# Check if prompt contains an agent command
if [[ "$USER_PROMPT" =~ ^/[a-z-]+$ ]]; then
    COMMAND="${USER_PROMPT:1}"  # Remove the leading /
    
    echo "🤖 Agent Command Detected: $COMMAND"
    
    # Check for workflow status file
    STATUS_FILE="/Users/jnt/ClaudeAutonomous/.claude/workflow/status/current_status.json"
    if [ -f "$STATUS_FILE" ]; then
        echo "📊 Current Workflow Status:"
        cat "$STATUS_FILE" | grep -E '"phase"|"current_agent"|"sprint_day"' | sed 's/^/  /'
    fi
    
    # Check for recent handoff notes
    HANDOFF_DIR="/Users/jnt/ClaudeAutonomous/.claude/workflow/handoffs"
    if [ -d "$HANDOFF_DIR" ]; then
        LATEST_HANDOFF=$(ls -t "$HANDOFF_DIR"/*.md 2>/dev/null | head -1)
        if [ ! -z "$LATEST_HANDOFF" ]; then
            echo "📝 Latest Handoff Note: $(basename "$LATEST_HANDOFF")"
        fi
    fi
    
    # Provide context based on command
    case "$COMMAND" in
        "po"|"sm"|"dev"|"qa"|"devops"|"tech-writer")
            echo "💡 Switching to $COMMAND agent role..."
            ;;
        "sprint-plan"|"standup"|"sprint-review"|"retro")
            echo "📅 Initiating $COMMAND ceremony..."
            ;;
    esac
fi

# Check for sprint status requests
if [[ "$USER_PROMPT" == *"status"* ]] || [[ "$USER_PROMPT" == *"progress"* ]]; then
    echo "📈 Checking sprint progress..."
fi