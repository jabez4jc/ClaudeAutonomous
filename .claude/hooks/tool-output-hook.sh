#!/bin/bash
# Hook to check for handoff triggers after tool outputs and trigger user alerts

# Read the tool output
TOOL_OUTPUT="$1"
TOOL_NAME="$2"

# Source the alert function
source "/Users/jnt/ClaudeAutonomous/.claude/hooks/user-attention-alert.sh"

# Check if this is a Write or Edit operation to workflow status
if [[ "$TOOL_NAME" == "Write" ]] || [[ "$TOOL_NAME" == "Edit" ]]; then
    if [[ "$TOOL_OUTPUT" == *"workflow/status/current_status.json"* ]]; then
        # Read the current status
        STATUS_FILE="/Users/jnt/ClaudeAutonomous/.claude/workflow/status/current_status.json"
        if [ -f "$STATUS_FILE" ]; then
            # Extract next agent from status file
            NEXT_AGENT=$(grep -o '"next_agent"[[:space:]]*:[[:space:]]*"[^"]*"' "$STATUS_FILE" | cut -d'"' -f4)
            
            if [ ! -z "$NEXT_AGENT" ]; then
                echo "🔄 Handoff detected: Preparing to transfer to $NEXT_AGENT agent"
                echo "📋 Creating handoff summary..."
                
                # Create timestamp
                TIMESTAMP=$(date +%Y%m%d_%H%M%S)
                
                # Log the handoff
                echo "[$TIMESTAMP] Handoff initiated to $NEXT_AGENT" >> /Users/jnt/ClaudeAutonomous/.claude/logs/handoff_log.txt
                
                # Trigger user attention alert for handoff
                trigger_alert "attention" "Agent handoff to $NEXT_AGENT - please review and approve"
            fi
        fi
    fi
fi

# Check for approval requirements in tool output
if [[ "$TOOL_OUTPUT" == *"requires approval"* ]] || [[ "$TOOL_OUTPUT" == *"permission denied"* ]] || [[ "$TOOL_OUTPUT" == *"confirmation required"* ]]; then
    trigger_alert "approval" "Command approval required to proceed"
fi

# Check for errors that need attention
if [[ "$TOOL_OUTPUT" == *"ERROR"* ]] || [[ "$TOOL_OUTPUT" == *"FAILED"* ]] || [[ "$TOOL_OUTPUT" == *"Exception"* ]]; then
    trigger_alert "error" "Error detected - please review and resolve"
fi

# Check for task completion signals
if [[ "$TOOL_OUTPUT" == *"Task completed"* ]] || [[ "$TOOL_OUTPUT" == *"Build successful"* ]] || [[ "$TOOL_OUTPUT" == *"Tests passed"* ]]; then
    trigger_alert "complete" "Task completed successfully - please review results"
fi

# Check for blocked workflows
if [[ "$TOOL_OUTPUT" == *"blocked"* ]] || [[ "$TOOL_OUTPUT" == *"waiting for input"* ]] || [[ "$TOOL_OUTPUT" == *"user intervention"* ]]; then
    trigger_alert "blocked" "Workflow blocked - user intervention required"
fi