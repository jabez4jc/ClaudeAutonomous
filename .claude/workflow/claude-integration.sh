#!/bin/bash

# Claude Integration for Autonomous Workflow
# Integrates with Claude Code to execute actual implementation phases

set -euo pipefail

WORKFLOW_DIR="/Users/jnt/ClaudeAutonomous/.claude/workflow"
LOGS_DIR="/Users/jnt/ClaudeAutonomous/.claude/logs"

# Claude Code commands for each phase
claude_understand() {
    local task="$1"
    local context_file="$WORKFLOW_DIR/understanding_context.md"
    
    cat > "$context_file" <<EOF
# Task Understanding Phase

## Original Request
$task

## Analysis Required
1. Break down the requirements
2. Identify dependencies and prerequisites  
3. Assess complexity and scope
4. List potential risks and challenges
5. Define success criteria

## Questions to Consider
- What is the core functionality needed?
- Are there any external dependencies?
- What are the input/output requirements?
- What edge cases need handling?
- What testing strategy is appropriate?

Please analyze this task and provide a structured breakdown.
EOF

    echo "Claude, please analyze the task in $context_file and create a comprehensive understanding document."
    echo "Focus on requirements, dependencies, risks, and success criteria."
}

claude_plan() {
    local task="$1"
    local planning_prompt="$WORKFLOW_DIR/planning_prompt.md"
    
    cat > "$planning_prompt" <<EOF
# Planning Phase

## Task to Plan
$task

## Planning Requirements
1. Create detailed subtasks with dependencies
2. Define implementation approach
3. Specify technology stack and tools
4. Outline testing strategy
5. Identify potential blockers

## Subtask Structure Needed
Each subtask should have:
- Clear description
- Dependencies on other subtasks
- Acceptance criteria
- Estimated complexity

## Output Format
Please create a structured plan with:
- Architecture overview
- Implementation steps
- Testing approach
- Risk mitigation strategies

Create subtasks that can be executed independently where possible.
EOF

    echo "Claude, please create a detailed implementation plan based on $planning_prompt"
    echo "Break the work into logical, manageable subtasks with clear dependencies."
}

claude_build() {
    local subtask="$1"
    local attempt="$2"
    local build_context="$WORKFLOW_DIR/build_context_$attempt.md"
    
    cat > "$build_context" <<EOF
# Build Phase - Attempt $attempt

## Subtask to Implement
$subtask

## Implementation Guidelines
1. Follow project conventions and existing patterns
2. Implement error handling and logging
3. Add appropriate comments and documentation
4. Ensure code is maintainable and testable
5. Follow security best practices

## Previous Attempt Context
EOF

    if [[ $attempt -gt 1 ]]; then
        echo "Previous attempt failed. Please review error logs and fix issues." >> "$build_context"
        if [[ -f "$LOGS_DIR/build_errors_$((attempt-1)).log" ]]; then
            echo "## Previous Errors:" >> "$build_context"
            cat "$LOGS_DIR/build_errors_$((attempt-1)).log" >> "$build_context"
        fi
    fi

    cat >> "$build_context" <<EOF

## Requirements
- Write clean, maintainable code
- Include proper error handling
- Add logging where appropriate
- Follow established patterns
- Prepare for comprehensive testing

Please implement this subtask with attention to quality and maintainability.
EOF

    echo "Claude, please implement the subtask described in $build_context"
    echo "Focus on clean, testable code that follows best practices."
}

claude_test() {
    local subtask="$1"
    local attempt="$2"
    local test_context="$WORKFLOW_DIR/test_context_$attempt.md"
    
    cat > "$test_context" <<EOF
# Test Phase - Attempt $attempt

## Subtask to Test
$subtask

## Testing Requirements
1. Write comprehensive unit tests
2. Add integration tests where needed
3. Test error conditions and edge cases
4. Ensure good code coverage (>80%)
5. Run security and performance tests

## Test Types Needed
- Unit tests for individual functions
- Integration tests for component interactions
- Error handling tests
- Edge case validation
- Performance benchmarks (if applicable)

## Previous Test Results
EOF

    if [[ $attempt -gt 1 ]]; then
        echo "Previous tests failed. Please fix issues and improve test coverage." >> "$test_context"
        if [[ -f "$LOGS_DIR/test_failures_$((attempt-1)).log" ]]; then
            echo "## Previous Test Failures:" >> "$test_context"
            cat "$LOGS_DIR/test_failures_$((attempt-1)).log" >> "$test_context"
        fi
    fi

    cat >> "$test_context" <<EOF

## Success Criteria
- All tests pass
- Code coverage >80%
- No security vulnerabilities
- Performance meets requirements
- Error handling works correctly

Please create and run comprehensive tests for this implementation.
EOF

    echo "Claude, please create and run comprehensive tests as described in $test_context"
    echo "Ensure all tests pass and coverage requirements are met."
}

# Integration with main orchestrator
case "${1:-}" in
    "understand")
        claude_understand "${2:-}"
        ;;
    "plan") 
        claude_plan "${2:-}"
        ;;
    "build")
        claude_build "${2:-}" "${3:-1}"
        ;;
    "test")
        claude_test "${2:-}" "${3:-1}"
        ;;
    *)
        echo "Usage: $0 {understand|plan|build|test} <task> [attempt_number]"
        exit 1
        ;;
esac