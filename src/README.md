# Source Code Directory

This directory contains your application source code. The structure varies based on your project type.

## Project Type Structures

### Complex Web Application (Separate Frontend/Backend)
```
src/
├── frontend/          # Frontend application code
│   ├── components/    # React/Vue/Svelte components
│   ├── pages/         # Route components
│   ├── hooks/         # Custom hooks
│   ├── utils/         # Utility functions
│   └── styles/        # CSS/styling files
├── backend/           # Backend API code
│   ├── routes/        # API route handlers
│   ├── models/        # Database models
│   ├── services/      # Business logic
│   ├── middleware/    # Express/Fastify middleware
│   └── utils/         # Backend utilities
├── shared/            # Shared utilities and types
│   ├── types/         # TypeScript type definitions
│   ├── constants/     # Shared constants
│   └── utils/         # Utilities used by both frontend and backend
└── packages/          # Monorepo packages (if applicable)
```

### Single Page Application (SPA)
```
src/
├── components/        # UI components
├── pages/             # Route components
├── hooks/             # Custom hooks
├── services/          # API services
├── stores/            # State management
├── utils/             # Utility functions
└── types/             # TypeScript definitions
```

### API/Backend Service
```
src/
├── routes/            # API route definitions
├── controllers/       # Request handlers
├── models/            # Database models
├── services/          # Business logic
├── middleware/        # Application middleware
├── utils/             # Utility functions
└── types/             # Type definitions
```

### Mobile Application
```
src/
├── screens/           # Screen components
├── components/        # Reusable UI components
├── navigation/        # Navigation configuration
├── services/          # API and device services
├── stores/            # State management
├── utils/             # Utility functions
└── types/             # Type definitions
```

## Code Organization Principles

- **Clear separation of concerns**
- **Consistent naming conventions**
- **Logical grouping of related functionality**
- **Easy navigation and discovery**
- **Scalable structure for growth**

The AI workflow automatically creates the appropriate structure based on your project type selection during `/project` initialization.