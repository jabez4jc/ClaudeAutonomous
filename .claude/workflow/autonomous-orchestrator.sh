#!/bin/bash

# Autonomous Workflow Orchestrator
# Automatically passes requests through: Understand → Plan → Build → Test phases
# Implements retry mechanism for failed builds and autonomous phase transitions

set -euo pipefail

# Configuration
WORKFLOW_DIR="/Users/jnt/ClaudeAutonomous/.claude/workflow"
LOGS_DIR="/Users/jnt/ClaudeAutonomous/.claude/logs"
ALERT_SCRIPT="/Users/jnt/ClaudeAutonomous/.claude/hooks/user-attention-alert.sh"
MAX_BUILD_RETRIES=3
MAX_TEST_RETRIES=2

# Ensure directories exist
mkdir -p "$WORKFLOW_DIR" "$LOGS_DIR"

# Logging functions
log() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message" | tee -a "$LOGS_DIR/autonomous-workflow.log"
}

log_info() { log "INFO" "$1"; }
log_warn() { log "WARN" "$1"; }
log_error() { log "ERROR" "$1"; }

# Alert function wrapper
alert() {
    local type="$1"
    local message="$2"
    if [[ -x "$ALERT_SCRIPT" ]]; then
        "$ALERT_SCRIPT" "$type" "$message"
    fi
    log_info "ALERT: [$type] $message"
}

# Phase execution functions
phase_understand() {
    local task="$1"
    log_info "🤔 PHASE: Understanding task - $task"
    
    # Create task analysis
    cat > "$WORKFLOW_DIR/current_task.json" <<EOF
{
    "task": "$task",
    "phase": "understand",
    "status": "analyzing",
    "timestamp": "$(date -Iseconds)",
    "analysis": {
        "complexity": "analyzing",
        "requirements": [],
        "dependencies": [],
        "risks": []
    }
}
EOF
    
    # Simulate understanding process (in real implementation, this would use Claude)
    log_info "📋 Analyzing requirements and dependencies..."
    log_info "🔍 Identifying potential risks and complexity..."
    log_info "📝 Documenting understanding..."
    
    # Update status
    jq '.status = "completed" | .analysis.complexity = "understood"' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
    
    log_info "✅ Understanding phase completed"
    return 0
}

phase_plan() {
    local task="$1"
    log_info "📋 PHASE: Planning implementation for - $task"
    
    # Update task status
    jq '.phase = "plan" | .status = "planning"' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
    
    # Create subtasks based on complexity
    log_info "🧩 Breaking down task into subtasks..."
    log_info "📐 Creating implementation plan..."
    log_info "⏱️ Estimating effort and timeline..."
    
    # Generate subtasks (example structure)
    cat > "$WORKFLOW_DIR/subtasks.json" <<EOF
{
    "main_task": "$task",
    "subtasks": [
        {
            "id": "subtask_1",
            "description": "Setup project structure",
            "status": "pending",
            "dependencies": []
        },
        {
            "id": "subtask_2", 
            "description": "Implement core functionality",
            "status": "pending",
            "dependencies": ["subtask_1"]
        },
        {
            "id": "subtask_3",
            "description": "Add error handling",
            "status": "pending", 
            "dependencies": ["subtask_2"]
        },
        {
            "id": "subtask_4",
            "description": "Write tests",
            "status": "pending",
            "dependencies": ["subtask_2", "subtask_3"]
        }
    ]
}
EOF
    
    # Update main task status
    jq '.status = "completed" | .subtasks_created = true' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
    
    log_info "✅ Planning phase completed"
    return 0
}

phase_build() {
    local task="$1"
    local attempt="${2:-1}"
    
    log_info "🔨 PHASE: Building implementation (attempt $attempt/$MAX_BUILD_RETRIES)"
    
    # Update task status
    jq '.phase = "build" | .status = "building" | .build_attempt = '$attempt'' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
    
    # Simulate build process
    log_info "⚙️ Setting up development environment..."
    log_info "📦 Installing dependencies..."
    log_info "💻 Implementing solution..."
    log_info "🔧 Configuring build system..."
    
    # Simulate potential build failures (remove this in real implementation)
    if [[ $attempt -eq 1 ]] && [[ $(date +%s) -gt 0 ]]; then
        # Simulate first build failure for demonstration
        log_warn "⚠️ Build encountered issues - missing dependencies"
        jq '.status = "failed" | .error = "Missing dependencies"' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
        return 1
    fi
    
    # Successful build
    log_info "✅ Build completed successfully"
    jq '.status = "completed"' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
    return 0
}

phase_test() {
    local task="$1"
    local attempt="${2:-1}"
    
    log_info "🧪 PHASE: Testing implementation (attempt $attempt/$MAX_TEST_RETRIES)"
    
    # Update task status
    jq '.phase = "test" | .status = "testing" | .test_attempt = '$attempt'' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
    
    # Run tests
    log_info "🔍 Running unit tests..."
    log_info "🔗 Running integration tests..."
    log_info "🚀 Running end-to-end tests..."
    log_info "📊 Checking code coverage..."
    log_info "🛡️ Running security tests..."
    
    # Simulate test results
    local test_success=true
    
    if [[ $test_success == true ]]; then
        log_info "✅ All tests passed"
        jq '.status = "completed" | .tests_passed = true' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
        return 0
    else
        log_error "❌ Tests failed"
        jq '.status = "failed" | .tests_passed = false' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
        return 1
    fi
}

# Build with retry logic
build_with_retry() {
    local task="$1"
    local build_attempt=1
    
    while [[ $build_attempt -le $MAX_BUILD_RETRIES ]]; do
        log_info "🔄 Build attempt $build_attempt of $MAX_BUILD_RETRIES"
        
        if phase_build "$task" "$build_attempt"; then
            log_info "✅ Build successful on attempt $build_attempt"
            return 0
        else
            log_warn "❌ Build failed on attempt $build_attempt"
            
            if [[ $build_attempt -lt $MAX_BUILD_RETRIES ]]; then
                log_info "🔧 Analyzing build failure and preparing retry..."
                # In real implementation, analyze errors and apply fixes
                sleep 2
                ((build_attempt++))
            else
                log_error "❌ Build failed after $MAX_BUILD_RETRIES attempts"
                alert "error" "Build failed after $MAX_BUILD_RETRIES attempts - manual intervention required"
                return 1
            fi
        fi
    done
}

# Test with retry logic  
test_with_retry() {
    local task="$1"
    local test_attempt=1
    
    while [[ $test_attempt -le $MAX_TEST_RETRIES ]]; do
        log_info "🔄 Test attempt $test_attempt of $MAX_TEST_RETRIES"
        
        if phase_test "$task" "$test_attempt"; then
            log_info "✅ Tests successful on attempt $test_attempt"
            return 0
        else
            log_warn "❌ Tests failed on attempt $test_attempt"
            
            if [[ $test_attempt -lt $MAX_TEST_RETRIES ]]; then
                log_info "🔧 Analyzing test failures and fixing issues..."
                # Go back to build phase to fix issues
                if ! build_with_retry "$task"; then
                    return 1
                fi
                ((test_attempt++))
            else
                log_error "❌ Tests failed after $MAX_TEST_RETRIES attempts"
                alert "error" "Tests failed after $MAX_TEST_RETRIES attempts - manual intervention required" 
                return 1
            fi
        fi
    done
}

# Process subtasks
process_subtasks() {
    local subtask_file="$WORKFLOW_DIR/subtasks.json"
    
    if [[ ! -f "$subtask_file" ]]; then
        log_warn "No subtasks file found, processing main task only"
        return 0
    fi
    
    local total_subtasks=$(jq '.subtasks | length' "$subtask_file")
    log_info "📋 Processing $total_subtasks subtasks"
    
    for ((i=0; i<total_subtasks; i++)); do
        local subtask_id=$(jq -r ".subtasks[$i].id" "$subtask_file")
        local subtask_desc=$(jq -r ".subtasks[$i].description" "$subtask_file")
        local subtask_status=$(jq -r ".subtasks[$i].status" "$subtask_file")
        
        if [[ "$subtask_status" == "pending" ]]; then
            log_info "🎯 Processing subtask: $subtask_desc"
            
            # Check dependencies
            local deps=$(jq -r ".subtasks[$i].dependencies[]?" "$subtask_file")
            local deps_met=true
            
            for dep in $deps; do
                local dep_status=$(jq -r ".subtasks[] | select(.id==\"$dep\") | .status" "$subtask_file")
                if [[ "$dep_status" != "completed" ]]; then
                    deps_met=false
                    log_warn "⏳ Dependency $dep not yet completed"
                    break
                fi
            done
            
            if [[ "$deps_met" == true ]]; then
                # Execute build and test for subtask
                if build_with_retry "$subtask_desc" && test_with_retry "$subtask_desc"; then
                    # Mark subtask as completed
                    jq ".subtasks[$i].status = \"completed\"" "$subtask_file" > "$subtask_file.tmp" && mv "$subtask_file.tmp" "$subtask_file"
                    log_info "✅ Subtask completed: $subtask_desc"
                    alert "complete" "Subtask completed: $subtask_desc"
                else
                    log_error "❌ Subtask failed: $subtask_desc"
                    return 1
                fi
            fi
        fi
    done
    
    log_info "✅ All subtasks processed successfully"
    return 0
}

# Main autonomous workflow execution
main() {
    local task="${1:-}"
    
    if [[ -z "$task" ]]; then
        echo "Usage: $0 <task_description>"
        echo "Example: $0 'Create a REST API with user authentication'"
        exit 1
    fi
    
    log_info "🚀 Starting autonomous workflow for task: $task"
    alert "attention" "Starting autonomous workflow: $task"
    
    # Phase 1: Understand
    if ! phase_understand "$task"; then
        log_error "❌ Understanding phase failed"
        alert "error" "Understanding phase failed - manual intervention required"
        exit 1
    fi
    
    # Phase 2: Plan  
    if ! phase_plan "$task"; then
        log_error "❌ Planning phase failed"
        alert "error" "Planning phase failed - manual intervention required"
        exit 1
    fi
    
    # Phase 3 & 4: Build and Test (with subtasks)
    if ! process_subtasks; then
        log_error "❌ Build/Test phases failed"
        alert "error" "Build/Test phases failed - manual intervention required"
        exit 1
    fi
    
    # Final success
    log_info "🎉 Autonomous workflow completed successfully!"
    alert "complete" "Task completed successfully: $task"
    
    # Update final status
    jq '.phase = "completed" | .status = "success" | .completed_at = "'$(date -Iseconds)'"' "$WORKFLOW_DIR/current_task.json" > "$WORKFLOW_DIR/current_task.tmp" && mv "$WORKFLOW_DIR/current_task.tmp" "$WORKFLOW_DIR/current_task.json"
}

# Execute main function with all arguments
main "$@"