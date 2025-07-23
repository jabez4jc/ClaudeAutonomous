# Technical Specifications Example

## Architecture
- **Pattern**: Microservices with API Gateway
- **Frontend**: Next.js 14+ with App Router
- **Backend**: Node.js + TypeScript + Express
- **Database**: PostgreSQL with Prisma ORM
- **Cache**: Redis for sessions and caching
- **Queue**: Bull Queue with Redis

## API Design
- **Style**: RESTful with OpenAPI 3.0 documentation
- **Authentication**: JWT tokens with refresh mechanism
- **Rate Limiting**: 100 requests/minute per user
- **Pagination**: Cursor-based for performance
- **Error Format**: RFC 7807 Problem Details

## Code Standards
- **Linting**: ESLint with Airbnb config
- **Formatting**: Prettier with 2-space indentation
- **Testing**: Jest + Testing Library, >90% coverage
- **Documentation**: TSDoc for all functions

## Framework Choices
- **State Management**: Zustand for client state, TanStack Query for server state
- **Styling**: Tailwind CSS with shadcn/ui components
- **Forms**: React Hook Form with Zod validation
- **Routing**: Next.js App Router with middleware

## Development Environment
- **Package Manager**: pnpm (not npm/yarn)
- **Node Version**: 20.x LTS
- **TypeScript**: 5.x with strict mode
- **Build Tool**: Vite for development, Next.js for production

## Testing Strategy
- **Unit Tests**: Jest + Testing Library for components
- **Integration Tests**: Supertest for API endpoints
- **E2E Tests**: Playwright for user journeys
- **Coverage**: >90% line coverage, >85% branch coverage

## Performance Requirements
- **Page Load**: <2 seconds on 3G connection
- **API Response**: <200ms for simple queries
- **Bundle Size**: <500KB initial load
- **Lighthouse Score**: >90 Performance, >95 Accessibility

## Security Requirements
- **Authentication**: JWT with proper expiration
- **Authorization**: Role-based access control (RBAC)
- **Input Validation**: All inputs validated with Zod
- **SQL Injection**: Prevented by ORM usage
- **XSS Protection**: Content Security Policy headers
- **HTTPS**: Required for all environments