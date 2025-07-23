# Coding Standards Example

## File Organization
- **Components**: PascalCase (UserProfile.tsx)
- **Utilities**: camelCase (formatDate.ts)
- **Constants**: UPPER_SNAKE_CASE (API_ENDPOINTS.ts)
- **Types**: PascalCase with T prefix (TUser, TApiResponse)
- **Interfaces**: PascalCase with I prefix (IUserService)
- **Enums**: PascalCase (UserRole, ApiStatus)

## Directory Structure
```
src/
├── components/        # Reusable UI components
│   ├── ui/           # Base UI components (Button, Input)
│   └── feature/      # Feature-specific components
├── hooks/            # Custom React hooks
├── utils/            # Utility functions
├── types/            # TypeScript type definitions
├── services/         # API and external service calls
├── stores/           # State management (Zustand stores)
└── constants/        # Application constants
```

## Code Patterns

### Error Handling
Always use Result<T, E> pattern for operations that can fail:
```typescript
type Result<T, E = Error> = { success: true; data: T } | { success: false; error: E };

async function fetchUser(id: string): Promise<Result<User>> {
  try {
    const user = await api.get(`/users/${id}`);
    return { success: true, data: user };
  } catch (error) {
    return { success: false, error: error as Error };
  }
}
```

### Async Operations
Prefer async/await over Promises:
```typescript
// Good
async function processData() {
  const data = await fetchData();
  const processed = await processData(data);
  return processed;
}

// Avoid
function processData() {
  return fetchData()
    .then(processData)
    .then(result => result);
}
```

### Component Structure
Follow consistent component organization:
```typescript
// Props interface first
interface UserProfileProps {
  userId: string;
  onUpdate?: (user: User) => void;
}

// Component implementation
export function UserProfile({ userId, onUpdate }: UserProfileProps) {
  // Hooks at the top
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);
  
  // Effects after hooks
  useEffect(() => {
    loadUser();
  }, [userId]);
  
  // Event handlers
  const handleUpdate = async (updates: Partial<User>) => {
    // Implementation
  };
  
  // Render logic
  if (loading) return <LoadingSpinner />;
  if (!user) return <ErrorMessage />;
  
  return (
    <div className="user-profile">
      {/* Component JSX */}
    </div>
  );
}

// Default export at bottom
export default UserProfile;
```

## Testing Requirements

### Unit Tests
- Every utility function must have unit tests
- All custom hooks must be tested
- Component tests should cover user interactions
- Mock external dependencies

### Integration Tests
- All API endpoints must have integration tests
- Database operations must be tested
- Third-party service integrations must be mocked

### E2E Tests
- Critical user journeys must have E2E tests
- Authentication flows must be tested
- Data persistence must be verified

### Coverage Requirements
- **Line Coverage**: >90%
- **Branch Coverage**: >85%
- **Function Coverage**: >95%
- **Statement Coverage**: >90%

## Performance Standards

### Frontend Performance
- **First Contentful Paint**: <1.5 seconds
- **Largest Contentful Paint**: <2.5 seconds
- **Cumulative Layout Shift**: <0.1
- **First Input Delay**: <100ms

### Bundle Size Limits
- **Initial Bundle**: <500KB gzipped
- **Route Chunks**: <200KB gzipped
- **Vendor Bundle**: <300KB gzipped

### API Performance
- **Simple Queries**: <200ms response time
- **Complex Queries**: <1 second response time
- **File Uploads**: <5 seconds for 10MB files
- **Database Queries**: <100ms for indexed queries

## Documentation Requirements

### Code Comments
- All public functions must have JSDoc comments
- Complex algorithms must be explained
- Business logic must be documented
- External dependencies must be noted

### README Files
- Each major directory should have a README
- Installation instructions must be current
- API endpoints must be documented
- Environment setup must be detailed

### Type Definitions
- All API responses must have TypeScript types
- Database models must have type definitions
- Component props must be properly typed
- Utility functions must have generic types where appropriate