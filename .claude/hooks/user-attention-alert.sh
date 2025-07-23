#!/bin/bash

# User Attention Alert System
# Plays audio alerts when user attention is required in the AI workflow

play_alert() {
    local alert_type="$1"
    local message="$2"
    
    # Cross-platform audio alert
    case "$(uname -s)" in
        Darwin)
            # macOS - play system alert sound
            afplay /System/Library/Sounds/Glass.aiff 2>/dev/null || 
            osascript -e "beep 3" 2>/dev/null ||
            echo -e "\a\a\a"  # Terminal bell fallback
            ;;
        Linux)
            # Linux - try various audio methods
            if command -v paplay >/dev/null 2>&1; then
                paplay /usr/share/sounds/alsa/Front_Left.wav 2>/dev/null
            elif command -v aplay >/dev/null 2>&1; then
                aplay /usr/share/sounds/alsa/Front_Left.wav 2>/dev/null
            elif command -v speaker-test >/dev/null 2>&1; then
                timeout 2 speaker-test -t sine -f 1000 -l 1 2>/dev/null
            else
                echo -e "\a\a\a"  # Terminal bell fallback
            fi
            ;;
        *)
            # Fallback for other systems
            echo -e "\a\a\a"
            ;;
    esac
}

show_notification() {
    local title="$1"
    local message="$2"
    
    case "$(uname -s)" in
        Darwin)
            # macOS notification
            osascript -e "display notification \"$message\" with title \"$title\" sound name \"Glass\"" 2>/dev/null
            ;;
        Linux)
            # Linux notification
            if command -v notify-send >/dev/null 2>&1; then
                notify-send "$title" "$message" --urgency=critical 2>/dev/null
            fi
            ;;
    esac
}

# Main alert function
trigger_alert() {
    local alert_type="${1:-attention}"
    local custom_message="$2"
    
    case "$alert_type" in
        "approval")
            local title="🤖 AI Workflow - Approval Required"
            local message="${custom_message:-Command requires your approval to proceed}"
            ;;
        "error")
            local title="⚠️ AI Workflow - Error"
            local message="${custom_message:-An error occurred that needs your attention}"
            ;;
        "complete")
            local title="✅ AI Workflow - Task Complete"
            local message="${custom_message:-Task completed - please review results}"
            ;;
        "blocked")
            local title="🚫 AI Workflow - Blocked"
            local message="${custom_message:-Workflow blocked - user intervention required}"
            ;;
        *)
            local title="👋 AI Workflow - Attention Required"
            local message="${custom_message:-Your attention is needed to continue}"
            ;;
    esac
    
    # Play audio alert
    play_alert "$alert_type" "$message"
    
    # Show desktop notification
    show_notification "$title" "$message"
    
    # Console output with visual emphasis
    echo ""
    echo "🔔 ============================================="
    echo "   $title"
    echo "   $message"
    echo "============================================="
    echo ""
}

# If script is called directly, trigger alert with provided arguments
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    trigger_alert "$@"
fi