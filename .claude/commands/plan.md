# /plan - Ultra Think Planning

"Ultra Think with structured intent" - Comprehensive requirements analysis with zero gaps, strict guideline adherence, and perfect dependency mapping.

## Ultra Think Requirements Analysis

### 1. Complete Requirements Mapping
- **Extract Every Feature**: Identify ALL requirements, including minor aspects and edge cases
- **Dependency Analysis**: Map every internal and external dependency clearly
- **Gap Detection**: Ensure no requirements are missed through systematic review
- **Priority Classification**: Categorize requirements by criticality and implementation order

### 2. Strict Guideline Adherence
- **Frontend Guidelines**: If provided, must be followed exactly - call out specific adherence in tasks
- **Backend Guidelines**: Architecture, patterns, and conventions must be strictly followed
- **Database Guidelines**: Schema design, naming conventions, and constraints must be adhered to
- **Design Templates**: UI/UX specifications must be implemented pixel-perfect

### 3. Template & Design Document Compliance
- **Frontend Templates**: HTML/CSS/Component structures must match exactly
- **Backend Templates**: API patterns, response formats, error handling must align
- **Database Templates**: Schema structure, relationships, indexes must be identical
- **Design Documents**: Visual specifications, interactions, flows must be precise

## MCP-Enhanced Process

### Pre-Planning: MCP Server Verification
Ensure essential MCP servers are running:
- **Context7**: Framework documentation access
- **Serena**: Codebase analysis capabilities
- **shadcn-ui**: Component library access
- **Desktop Commander**: File management capabilities
- **Playwright**: Testing automation readiness

### Planning Process
1. **MCP-Enhanced Ultra Think Analysis**: 
   - **Context7**: Access current framework documentation and best practices
   - **Serena**: Analyze existing codebase patterns and architecture
   - Comprehensively analyze ALL requirements and dependencies
2. **Guidelines Review**: Identify and document all provided guidelines and templates
3. **Dependency Mapping**: Create complete dependency graph with clear relationships
4. **MCP-Informed Task Creation**: Generate detailed tasks with:
   - **shadcn-ui**: Available components and design patterns
   - **Context7**: Framework-specific implementation guidance
   - Explicit guideline adherence requirements

## Enhanced Task Format
```markdown
# Task: [What to build]

## Requirements Coverage
- **Primary Requirement**: [Specific requirement being addressed]
- **Related Requirements**: [All connected requirements that must be considered]
- **Edge Cases**: [Minor aspects and edge cases that must be handled]

## Dependencies
- **Prerequisite Tasks**: [Tasks that must be completed first]
- **External Dependencies**: [APIs, services, libraries required]
- **Internal Dependencies**: [Components, modules, data structures needed]

## Guideline Adherence
- **Frontend Guidelines**: [Specific guidelines that must be followed]
- **Backend Guidelines**: [Architecture patterns and conventions to follow]
- **Database Guidelines**: [Schema and naming conventions to adhere to]
- **Design Templates**: [Templates and designs that must be matched exactly]

## Implementation Specifications
- **Exact Requirements**: [Precise specifications with no interpretation gaps]
- **Template Compliance**: [Specific templates/designs to follow pixel-perfect]
- **Pattern Adherence**: [Code patterns and structures that must be used]

## Success Criteria
- [ ] ALL requirements met without gaps
- [ ] Guidelines strictly followed
- [ ] Templates matched exactly
- [ ] Dependencies properly handled
- [ ] Tests written and passing
- [ ] Zero hallucinations or assumptions
```

## Requirements Analysis Checklist

### Before Creating Tasks
- [ ] **Complete Requirements Review**: Every requirement identified and documented
- [ ] **Dependency Mapping**: All dependencies clearly mapped with relationships
- [ ] **Guidelines Identified**: All provided guidelines and templates documented
- [ ] **Design Compliance**: Templates and designs referenced for exact adherence
- [ ] **Edge Case Coverage**: Minor aspects and edge cases identified
- [ ] **Gap Analysis**: Systematic review to ensure nothing is missed

### When Adding New Tasks Later (During /build phase)
- [ ] **Bug-Driven Task Creation**: Create subtasks when bugs reveal missing dependencies
- [ ] **Dependency Check**: New tasks dependencies mapped to existing tasks
- [ ] **Plan Updates**: Update existing task dependencies when new prerequisites discovered
- [ ] **Guidelines Adherence**: Same guidelines and templates must be followed
- [ ] **Requirements Traceability**: New tasks traced back to original requirements
- [ ] **Design Consistency**: Must maintain consistency with provided templates
- [ ] **Integration Impact**: Consider impact on existing planned and in-progress tasks

## Usage
- `/plan` - Create comprehensive task breakdown with Ultra Think analysis
- `/plan "feature name"` - Plan specific feature with complete requirements mapping

## Task Storage
Tasks are stored in `tasks/` directory:
- `tasks/todo/` - Ready to work on with complete specifications
- `tasks/done/` - Completed tasks with adherence verification

## Expected Output
Creates ALL necessary tasks to cover requirements completely:
- **Complete Requirements Coverage**: Every requirement becomes at least one task
- **Comprehensive Task Breakdown**: All features, components, and integrations covered
- **Clear Dependency Mapping**: All task relationships and prerequisites defined
- **Explicit Guideline Adherence**: Each task specifies compliance requirements
- **Template Compliance Specifications**: Design adherence requirements per task
- **Zero Ambiguity**: No interpretation gaps or missing implementation details

**Note**: The number of tasks created depends on requirements complexity - could be 5, 15, or 50+ tasks to ensure complete coverage.