# Analysis Document Templates

Templates for the three documents generated in Phase 1 (Deep Project Analysis). Output to `docs/analysis/`.

---

## project-overview.md

```markdown
# Project Overview

## Task Definition
<!-- One-sentence summary of what this transformation aims to achieve -->

## Current Architecture
<!-- High-level architecture diagram (Mermaid) and description -->

## Technology Stack
| Layer        | Current          | Target           |
|:-------------|:-----------------|:-----------------|
| Language     |                  |                  |
| Framework    |                  |                  |
| Build Tool   |                  |                  |
| Package Mgr  |                  |                  |
| Database     |                  |                  |
| Deployment   |                  |                  |

## Entry Points
<!-- List of main entry points: CLI commands, API endpoints, UI routes, etc. -->

## Build & Run
<!-- How to build, test, and run the project currently -->

## External Integrations
<!-- APIs, databases, services, file systems the project interacts with -->
```

---

## module-inventory.md

```markdown
# Module Inventory

| Module | Responsibility | Dependencies | Files | Lines | Complexity |
|:-------|:---------------|:-------------|------:|------:|:-----------|
|        |                |              |       |       |            |

## Module Details

### <Module Name>
- **Path**: `src/module_name/`
- **Responsibility**: What this module does
- **Public API**: Key functions/classes exposed to other modules
- **Internal Dependencies**: Which other project modules it imports
- **External Dependencies**: Third-party libraries it uses
- **Complexity Rating**: Low / Medium / High / Critical
- **Transformation Notes**: Specific challenges or considerations for this module
```

---

## risk-assessment.md

```markdown
# Risk Assessment

## Risk Matrix

| Risk | Impact | Likelihood | Severity | Mitigation |
|:-----|:-------|:-----------|:---------|:-----------|
|      |        |            |          |            |

## High-Severity Risks
<!-- Detailed discussion of each high-severity risk -->

## Technical Debt
<!-- Pre-existing issues that may complicate the transformation -->

## Compatibility Concerns
<!-- API compatibility, data format changes, deployment changes -->
```
