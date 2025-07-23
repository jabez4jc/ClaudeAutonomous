#!/bin/bash
# Setup development environment for the project

echo "🔧 Setting up development environment..."

# Detect project type and set up accordingly
PROJECT_TYPE=""

# Check for Python project
if [ -f "pyproject.toml" ] || [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "main.py" ] || [ -f "app.py" ]; then
    PROJECT_TYPE="python"
    echo "📦 Python project detected"
    
    # Install UV if not present
    if ! command -v uv &> /dev/null; then
        echo "📥 Installing Astral UV..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
        export PATH="$HOME/.cargo/bin:$PATH"
    fi
    
    # Initialize UV project if needed
    if [ ! -f "pyproject.toml" ]; then
        echo "🎯 Initializing UV project..."
        uv init . --no-readme
    fi
    
    # Create virtual environment
    if [ ! -d ".venv" ]; then
        echo "🐍 Creating virtual environment..."
        uv venv
    fi
    
    # Install common Python development tools
    echo "🛠️ Installing Python development tools..."
    uv add --dev pytest pytest-cov pytest-asyncio
    uv add --dev black isort mypy ruff
    uv add --dev pre-commit
    
    # Set up pre-commit hooks
    if [ -f ".pre-commit-config.yaml" ]; then
        uv run pre-commit install
    else
        # Create basic pre-commit config
        cat > .pre-commit-config.yaml << 'EOF'
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files
  
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.9
    hooks:
      - id: ruff
        args: [--fix]
      - id: ruff-format
  
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.8.0
    hooks:
      - id: mypy
        additional_dependencies: [types-all]
EOF
        uv run pre-commit install
    fi
    
    echo "✅ Python environment ready! Activate with: source .venv/bin/activate"
fi

# Check for Node.js project
if [ -f "package.json" ]; then
    PROJECT_TYPE="${PROJECT_TYPE:+$PROJECT_TYPE/}node"
    echo "📦 Node.js project detected"
    
    # Install dependencies based on lockfile
    if [ -f "package-lock.json" ]; then
        echo "📥 Installing with npm..."
        npm install
    elif [ -f "yarn.lock" ]; then
        echo "📥 Installing with yarn..."
        yarn install
    elif [ -f "pnpm-lock.yaml" ]; then
        echo "📥 Installing with pnpm..."
        pnpm install
    else
        echo "📥 No lockfile found, using npm..."
        npm install
    fi
    
    # Install common dev dependencies if not present
    if ! grep -q "eslint" package.json; then
        echo "🛠️ Installing development tools..."
        npm install --save-dev eslint prettier jest
    fi
    
    echo "✅ Node.js environment ready!"
fi

# Check for Go project
if [ -f "go.mod" ] || [ -f "main.go" ]; then
    PROJECT_TYPE="${PROJECT_TYPE:+$PROJECT_TYPE/}go"
    echo "📦 Go project detected"
    
    # Initialize go module if needed
    if [ ! -f "go.mod" ]; then
        echo "🎯 Initializing Go module..."
        go mod init $(basename "$PWD")
    fi
    
    # Download dependencies
    echo "📥 Downloading Go dependencies..."
    go mod download
    go mod tidy
    
    # Install common Go tools
    echo "🛠️ Installing Go development tools..."
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
    go install golang.org/x/tools/cmd/goimports@latest
    
    echo "✅ Go environment ready!"
fi

# Check for Rust project
if [ -f "Cargo.toml" ]; then
    PROJECT_TYPE="${PROJECT_TYPE:+$PROJECT_TYPE/}rust"
    echo "📦 Rust project detected"
    
    # Build dependencies
    echo "📥 Building Rust dependencies..."
    cargo build
    
    # Install common Rust tools
    if ! command -v cargo-watch &> /dev/null; then
        echo "🛠️ Installing Rust development tools..."
        cargo install cargo-watch cargo-edit
    fi
    
    echo "✅ Rust environment ready!"
fi

# Create common directories if they don't exist
echo "📁 Setting up directory structure..."
mkdir -p src tests docs/api docs/decisions

# Initialize git if not already
if [ ! -d ".git" ]; then
    echo "📝 Initializing git repository..."
    git init
    
    # Create .gitignore if not exists
    if [ ! -f ".gitignore" ]; then
        cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
.venv/
venv/
env/
.env
.pytest_cache/
.mypy_cache/
.ruff_cache/
*.egg-info/
dist/
build/
.coverage
htmlcov/
.tox/

# Node
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.npm
.yarn-integrity
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# Build outputs
*.log
*.pid
*.seed
*.pid.lock
.cache/
coverage/
.nyc_output/

# OS
Thumbs.db
EOF
    fi
fi

echo ""
echo "🎉 Development environment setup complete!"
echo "📋 Project type: ${PROJECT_TYPE:-unknown}"
echo ""
echo "Next steps:"
echo "1. Run './init_sprint.sh' to start your first sprint"
echo "2. Use '/po' to begin defining user stories"
echo "3. Check './check_status.sh' to monitor progress"

# Create a project info file for agents
cat > .claude/project_info.json << EOF
{
  "project_type": "${PROJECT_TYPE:-unknown}",
  "setup_date": "$(date +%Y-%m-%d)",
  "python_package_manager": "uv",
  "node_package_manager": "$(if [ -f 'yarn.lock' ]; then echo 'yarn'; elif [ -f 'pnpm-lock.yaml' ]; then echo 'pnpm'; else echo 'npm'; fi)"
}
EOF