# Tasks Directory

This directory contains task files created by the `/plan` command.

## Structure
- `todo/` - Tasks ready to be implemented by `/auto`
- `done/` - Completed tasks for reference

## Task Creation Principles
- **Complete Requirements Coverage**: ALL requirements become tasks - no arbitrary limits
- **User-Provided Sources Only**: Tasks created solely from user requirements, guidelines, templates
- **Zero Example Contamination**: Example files never used as implementation guidance
- **Perfect Specification Adherence**: Guidelines and templates followed exactly

## Task Files
Task files contain:
- Complete requirements mapping including edge cases
- Clear dependency relationships
- Explicit guideline adherence requirements
- Template compliance specifications
- Zero ambiguity or interpretation gaps

## Dynamic Planning
During `/build` phase, if bugs reveal missing dependencies:
- New subtasks created automatically
- Dependency mappings updated
- Current task paused until prerequisites completed
- Plan evolves to ensure complete coverage

## Important Notes
- **No example references**: AI must never use example files for implementation guidance
- **Requirements only**: Tasks based exclusively on user specifications  
- **Complete coverage**: Every requirement must be converted to tasks (could be 5, 15, or 50+ tasks)
- **Perfect adherence**: Guidelines and templates followed pixel-perfect