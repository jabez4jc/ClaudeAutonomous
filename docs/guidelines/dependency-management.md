# Dependency Management Guidelines

## Core Principle: Project-Isolated Dependencies

**All application dependencies MUST be contained within the project directory. No global system installations.**

## 🐍 Python Backend Dependencies

### Required: Use Astral UV for Python Project Management

**Why UV?**
- Fastest Python package manager (10-100x faster than pip)
- Automatic virtual environment management
- Project-isolated dependencies by default
- Compatible with all Python packaging standards

#### Project Setup with UV
```bash
# Initialize Python project with UV
uv init

# Create project with specific Python version
uv init --python 3.11

# Add dependencies (automatically creates virtual environment)
uv add fastapi uvicorn sqlalchemy pytest

# Add development dependencies
uv add --dev pytest-cov black isort mypy

# Install all dependencies from pyproject.toml
uv sync

# Run commands in the isolated environment
uv run python main.py
uv run pytest
uv run black .
```

### UV Project Structure
```
your-project/
├── pyproject.toml          # UV manages this automatically
├── uv.lock                 # Lock file for reproducible builds
├── .venv/                  # Isolated virtual environment (UV managed)
│   ├── bin/
│   ├── lib/
│   └── pyvenv.cfg
├── src/
│   └── your_app/
└── tests/
```

### Forbidden Commands (System-Level)
```bash
# ❌ NEVER use these - they pollute the system
pip install package-name
python -m pip install package-name
pip3 install package-name
sudo pip install package-name

# ❌ NEVER create virtual environments manually
python -m venv venv
virtualenv venv
conda create -n myenv
```

### Required Commands (Project-Isolated)
```bash
# ✅ ALWAYS use UV for Python dependency management
uv add package-name                    # Add runtime dependency
uv add --dev package-name              # Add development dependency  
uv remove package-name                 # Remove dependency
uv sync                                # Install all dependencies
uv run python script.py               # Run Python in isolated environment
uv run pytest                         # Run tests in isolated environment
```

## 🌐 Frontend Dependencies (Node.js)

### Required: Use Package Manager with Local Installation

**Preferred Order: pnpm > yarn > npm**

#### Project Setup
```bash
# Initialize with package manager of choice
pnpm init              # Fastest, most efficient
# OR
yarn init              # Good alternative
# OR  
npm init               # Fallback option

# Install dependencies locally
pnpm install           # Creates node_modules/ in project
yarn install
npm install

# Add new dependencies
pnpm add react fastify
yarn add react fastify  
npm install react fastify

# Add development dependencies
pnpm add -D typescript @types/node vite
yarn add -D typescript @types/node vite
npm install -D typescript @types/node vite
```

### Frontend Project Structure
```
your-project/
├── package.json
├── pnpm-lock.yaml         # OR yarn.lock / package-lock.json
├── node_modules/          # All dependencies contained here
│   ├── react/
│   ├── typescript/
│   └── ...
├── src/
│   ├── components/
│   └── pages/
└── dist/                  # Build output
```

### Forbidden Commands (Global Installation)
```bash
# ❌ NEVER install packages globally
npm install -g package-name
yarn global add package-name  
pnpm add -g package-name

# ❌ NEVER use system-wide package managers without project context
sudo npm install
sudo yarn add
```

### Required Commands (Project-Local)
```bash
# ✅ ALWAYS install dependencies locally
pnpm add package-name                  # Runtime dependency
pnpm add -D package-name               # Development dependency
pnpm remove package-name               # Remove dependency
pnpm install                           # Install all dependencies

# ✅ Run tools from local node_modules
npx tsc                                # TypeScript compiler
npx vite build                         # Vite bundler
npx eslint src/                        # ESLint linter
yarn dlx create-next-app               # One-time tools
```

## 🔧 Development Environment Setup

### Environment Variables
```bash
# .env.local
# Python UV configuration
UV_CACHE_DIR=./.uv-cache
UV_PROJECT_ENVIRONMENT=./.venv

# Node.js configuration  
NODE_ENV=development
NPM_CONFIG_PREFIX=./node_modules
```

### Project-Level Tool Configuration

#### Python Tools Configuration (pyproject.toml)
```toml
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[project]
name = "your-app"
version = "0.1.0"
dependencies = [
    "fastapi>=0.104.0",
    "uvicorn[standard]>=0.24.0",
    "sqlalchemy>=2.0.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.4.0",
    "pytest-cov>=4.1.0",
    "black>=23.0.0",
    "isort>=5.12.0",
    "mypy>=1.5.0",
]

[tool.black]
line-length = 88
target-version = ['py311']

[tool.isort]
profile = "black"
line_length = 88

[tool.mypy]
python_version = "3.11"
strict = true
```

#### Frontend Tools Configuration (package.json)
```json
{
  "name": "your-frontend",
  "version": "0.1.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "test": "vitest",
    "lint": "eslint src/",
    "format": "prettier --write src/"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.0",
    "@typescript-eslint/eslint-plugin": "^6.0.0",
    "eslint": "^8.50.0",
    "prettier": "^3.0.0",
    "typescript": "^5.2.0",
    "vite": "^4.4.0",
    "vitest": "^0.34.0"
  }
}
```

## 🚀 Integration with AI Workflow Commands

### Enhanced Auto-Approval Commands

Update `.claude/settings.local.json` to prefer isolated dependency management:

```json
{
  "autoApprove": {
    "enabled": true,
    "commands": [
      "uv add", "uv remove", "uv sync", "uv run", "uv init",
      "pnpm add", "pnpm remove", "pnpm install", "pnpm run",
      "yarn add", "yarn remove", "yarn install", "yarn run",
      "npm install", "npm run", "npx"
    ],
    "requireApprovalFor": [
      "pip install", "pip3 install", "python -m pip install",
      "npm install -g", "yarn global add", "pnpm add -g",
      "sudo pip", "sudo npm", "sudo yarn"
    ]
  }
}
```

### Project Initialization Templates

#### Python FastAPI Project
```bash
# UV-based Python API setup
uv init --python 3.11
uv add fastapi uvicorn[standard] sqlalchemy psycopg2-binary
uv add --dev pytest pytest-cov black isort mypy
```

#### Next.js Frontend Project
```bash
# pnpm-based React setup
pnpm create next-app@latest . --typescript --tailwind --eslint --app
pnpm add @radix-ui/react-components lucide-react
pnpm add -D prettier @types/node
```

## 📋 Enforcement Rules for AI Agents

### Build Phase Requirements
1. **Always check for local dependency management**
   - Python: Verify `pyproject.toml` and `.venv/` exist
   - Node.js: Verify `package.json` and `node_modules/` exist

2. **Use correct package managers**
   - Python: Use `uv` commands only
   - Node.js: Use `pnpm`/`yarn`/`npm` (local only)

3. **Verify isolation**
   - Check that dependencies are installed in project directory
   - Confirm no global installations are used

### Testing Phase Requirements
1. **Run tests in isolated environments**
   ```bash
   # Python
   uv run pytest --cov=src tests/
   
   # Node.js
   pnpm test
   ```

2. **Verify dependency resolution**
   - Ensure all imports resolve from local dependencies
   - Check lock files are up to date

### Deployment Phase Requirements
1. **Container-based deployment** (preferred)
   - Dependencies isolated within container
   - No system-level installations

2. **Production dependency management**
   ```dockerfile
   # Python Dockerfile
   FROM python:3.11-slim
   COPY pyproject.toml uv.lock ./
   RUN pip install uv && uv sync --frozen
   
   # Node.js Dockerfile  
   FROM node:18-alpine
   COPY package.json pnpm-lock.yaml ./
   RUN npm install -g pnpm && pnpm install --frozen-lockfile
   ```

## 🔍 Troubleshooting Common Issues

### Python Issues
```bash
# Problem: "command not found: uv"
# Solution: Install UV system-wide (one-time setup)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Problem: "No module named 'package'"
# Solution: Ensure you're using uv run
uv run python your_script.py
```

### Node.js Issues
```bash
# Problem: "command not found: package-command"
# Solution: Use npx to run local binaries
npx typescript-compiler
npx vite build

# Problem: Different lockfile formats
# Solution: Use consistent package manager
rm yarn.lock package-lock.json  # Keep only pnpm-lock.yaml
```

## ✅ Validation Checklist

Before any development session:
- [ ] Python projects use UV (`uv.lock` exists)
- [ ] Node projects have local `node_modules/`
- [ ] No global package installations in commands
- [ ] All tools run through `uv run` or `npx`
- [ ] Lock files are committed to version control
- [ ] Dependencies are specified in project files only

This ensures completely isolated, reproducible development environments! 🎯