# /context - Intelligent Context Window Management

Proactive, task-aware context management that maintains optimal AI performance throughout development sessions.

## The Problem with Current Approach

**Reactive `/compact`**:
- Triggers when context is almost full (too late)
- Loses task-specific context and momentum
- Generic compression without understanding current work
- Disrupts ongoing development flow
- Forces context rebuild from scratch

## Intelligent Context Management Solution

### Proactive Context Monitoring
Monitor context usage continuously and intervene at optimal points:

- **Green Zone (0-60%)**: Full context available, no intervention
- **Yellow Zone (60-80%)**: Start selective pruning of least relevant content
- **Orange Zone (80-90%)**: Aggressive pruning, preserve only task-critical context
- **Red Zone (90%+)**: Emergency context preservation and reset

### Context Relevance Scoring

**High Priority (Always Preserve)**:
- **Current task details** and success criteria
- **Active codebase context** (files being modified)
- **Recent error messages** and debugging context
- **User feedback** and approval/rejection history
- **Project-specific requirements** and constraints

**Medium Priority (Selective Preservation)**:
- **Related task context** from same feature area
- **Recent file reads** and code understanding
- **Dependency information** and configuration details
- **Test results** and quality metrics
- **Planning decisions** and architectural choices

**Low Priority (First to Prune)**:
- **Historical conversation** beyond current session
- **Exploratory file reads** not related to current task
- **Completed task details** (unless directly related)
- **General documentation** reading
- **Status queries** and monitoring commands

## Automatic Context Management Commands

### `/context auto` - Enable Automatic Management
```bash
# Enable proactive context management
/context auto

# AI will automatically:
# 1. Monitor context usage in real-time
# 2. Prune low-priority content at 60% threshold
# 3. Preserve task-critical context at 80% threshold  
# 4. Create context snapshots before major operations
# 5. Restore relevant context when needed
```

### `/context save` - Create Task-Specific Snapshot
```bash
# Save current context state with task association
/context save "implementing user authentication API"

# Creates: .claude/context/task-auth-api-20250724.json
# Contains:
# - Current task details and progress
# - Active file context and modifications
# - Key decisions and user feedback
# - Related code understanding
# - Test results and error context
```

### `/context restore` - Intelligent Context Restoration
```bash
# Restore context for specific task or feature area
/context restore "user authentication"

# AI automatically:
# 1. Finds most relevant saved context
# 2. Loads task-specific information
# 3. Restores file understanding and modifications
# 4. Rebuilds coding context efficiently
# 5. Summarizes what was restored
```

### `/context prune` - Manual Context Optimization
```bash
# Manually trigger intelligent pruning
/context prune

# Options:
/context prune --aggressive    # Remove more content, keep only essentials
/context prune --preserve-files # Keep all file reading context
/context prune --preserve-errors # Keep debugging and error context
```

## Context Persistence Strategy

### Task-Aware Memory Storage
```json
{
  "context_snapshot": {
    "task_id": "task-001-user-auth",
    "timestamp": "2025-07-24T10:30:00Z",
    "context_size": "45%",
    "priority_content": {
      "current_task": {
        "title": "Implement JWT authentication",
        "progress": "building login endpoint",
        "files_modified": ["src/auth.py", "src/models.py"],
        "current_issues": ["JWT token validation failing"],
        "user_feedback": ["approved API design", "requested 2FA support"]
      },
      "active_code_context": {
        "src/auth.py": "JWT implementation with refresh tokens",
        "src/models.py": "User model with authentication fields",
        "tests/test_auth.py": "Authentication test suite"
      },
      "project_context": {
        "tech_stack": "FastAPI + SQLAlchemy + PostgreSQL",
        "auth_requirements": "JWT + 2FA + OAuth integration",
        "security_constraints": "OWASP compliance required"
      }
    },
    "medium_priority": {
      "related_tasks": ["task-002-user-profile", "task-003-permissions"],
      "dependency_info": ["redis for sessions", "sendgrid for emails"],
      "recent_decisions": ["chose JWT over sessions", "using bcrypt for passwords"]
    },
    "prunable_content": {
      "exploration_reads": ["docs/api-examples.md", "README.md"],
      "completed_tasks": ["task-000-project-setup"],
      "status_queries": ["/status", "/project info"]
    }
  }
}
```

### Automatic Context Snapshots
The AI automatically creates context snapshots at key moments:

- **Before starting new tasks** (preserve previous context)
- **Before major refactoring** (preserve pre-change state)
- **After completing milestones** (preserve decision context)
- **Before context pruning** (safety backup)
- **When switching between features** (preserve feature-specific context)

## Integration with Workflow Commands

### Enhanced `/auto` with Context Management
```bash
/auto --context-aware "implement user dashboard"

# AI automatically:
# 1. Saves current context before starting
# 2. Loads relevant context for dashboard work
# 3. Monitors context usage during development
# 4. Prunes non-dashboard content as needed
# 5. Preserves all dashboard-related decisions and code
```

### Context-Aware Task Switching
```bash
# When switching between tasks, AI automatically:
# 1. Saves current task context
# 2. Loads target task context
# 3. Provides brief summary of context switch
# 4. Maintains continuity of development flow
```

## Context Window Optimization Strategies

### Intelligent Content Compression
Instead of generic compression, use task-aware summarization:

**File Context Compression**:
```
Original (500 tokens):
[Full file content with implementation details]

Compressed (50 tokens):  
"src/auth.py: JWT authentication with login/logout endpoints, bcrypt password hashing, refresh token rotation, validation middleware"
```

**Conversation Compression**:
```
Original (200 tokens):
[Full conversation about API design decisions]

Compressed (30 tokens):
"API design approved: JWT auth, RESTful endpoints, OpenAPI docs, user requested 2FA support"
```

### Context Layering Strategy
Maintain multiple context layers with different retention priorities:

**Layer 1 - Immediate Context (Always Kept)**:
- Current task and immediate next steps
- Active file modifications and current errors
- Recent user feedback and decisions

**Layer 2 - Session Context (Kept Until 80%)**:
- Related files and code understanding
- Task dependencies and project constraints
- Recent test results and quality metrics

**Layer 3 - Historical Context (First to Prune)**:
- Completed tasks and old decisions
- Exploratory code reading
- General project documentation

## Proactive Context Triggers

### Smart Intervention Points
**At 60% Context Usage**:
- Prune completed task details
- Compress old conversation history
- Summarize exploratory file reads
- Remove redundant status information

**At 80% Context Usage**:
- Aggressive pruning of non-critical content
- Create comprehensive task snapshot
- Keep only essential code and task context
- Warn user of approaching context limit

**At 90% Context Usage**:
- Emergency context preservation
- Save complete snapshot to disk
- Reset to minimal essential context
- Load task-critical information only

### Context Health Monitoring
```bash
/context status

# Output:
# 📊 Context Usage: 72% (Yellow Zone)
# 🎯 Current Task: Implementing user authentication API  
# 📁 Active Files: 3 (src/auth.py, src/models.py, tests/test_auth.py)
# 💾 Last Snapshot: 15 minutes ago
# 🔄 Auto-pruning: Enabled (triggered at 60%)
# ⚠️ Recommendations: Consider saving snapshot before next major task
```

## Manual Context Management

### Context Inspection Tools
```bash
/context analyze
# Shows context usage breakdown by category:
# - Task context: 25%
# - Code files: 30% 
# - Conversation: 20%
# - Documentation: 15%
# - Other: 10%

/context files
# Lists all files in context with relevance scores:
# - src/auth.py (high relevance - currently modifying)
# - src/models.py (high relevance - dependency)
# - README.md (low relevance - explored only)
```

### Selective Context Operations
```bash
/context keep src/auth.py src/models.py
# Mark specific files as high-priority (never prune)

/context prune conversation --older-than 30min
# Remove conversation older than 30 minutes

/context compress documentation
# Compress all documentation reads to summaries
```

## Expected Behavior

### Seamless Context Management
1. **Proactive monitoring** prevents context overflow
2. **Task-aware preservation** maintains development continuity  
3. **Intelligent restoration** quickly rebuilds relevant context
4. **Automatic snapshots** provide safety nets for context recovery
5. **Minimal user intervention** required for optimal performance

### Performance Benefits
- **Consistent AI quality** throughout long development sessions
- **Faster response times** with optimized context size
- **Better task focus** through relevant context preservation
- **Reduced context rebuilding** through smart snapshots
- **Seamless task switching** with automatic context management

This system transforms context management from a disruptive emergency measure into a smooth, intelligent process that enhances rather than interrupts the development workflow.