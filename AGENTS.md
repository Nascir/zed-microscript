# AGENTS.md

**Important:** This file should be reviewed and updated whenever the project structure, configuration, or workflow changes. Keep it synchronized with the current state of the project.

## Project Overview

**Repository:** https://github.com/Nascir/microscript_zed_extension

This is a Zed editor extension for the microScript programming language. It provides:
- Syntax highlighting
- Code folding
- Bracket matching and auto-pairing
- Auto-indentation
- Code outline and symbol navigation
- JavaScript injection for `system.javascript()` calls

**Type:** Pure configuration extension (no Rust code). All functionality is defined through TOML config and tree-sitter query files.

## Related Projects / Dependencies

| Project | URL | Description |
|---------|-----|-------------|
| Tree-sitter Grammar | https://github.com/Nascir/tree-sitter-microscript | microScript grammar for tree-sitter |

**Current grammar commit SHA:** `d4716468247e4e66e2cc62a239e9343ddc227c6d`

## Project Structure

### Key Configuration Files

| File | Purpose |
|------|---------|
| `extension.toml` | Extension manifest, grammar source/rev |
| `languages/microscript/config.toml` | File extensions, comments, brackets |
| `languages/microscript/highlights.scm` | Syntax highlighting rules |
| `languages/microscript/indents.scm` | Auto-indentation rules |
| `languages/microscript/brackets.scm` | Bracket pair matching |
| `languages/microscript/outline.scm` | Code structure for outline panel |
| `languages/microscript/locals.scm` | Variable scope tracking |
| `languages/microscript/injections.scm` | Language injection rules |
| `languages/microscript/tags.scm` | Symbol navigation for Go to Definition, Find References |

### Local Grammar Directory (`/grammars/`) - Not Tracked

The `/grammars/` directory is **not tracked by git** and serves as an optional local development workspace. It is **not** part of the repository.

**Purpose:** Developers can manually clone or copy the [tree-sitter-microscript](https://github.com/Nascir/tree-sitter-microscript) grammar here for local reference when working on query files.

**Important:** The actual grammar used by the Zed extension is fetched automatically from GitHub based on the `commit` field in `extension.toml`. The local `/grammars/` directory has no effect on the extension's behavior.

## Build, Lint, and Test Commands

### Development Workflow

```bash
# No traditional build process - this is a config-only extension
# Changes to .scm and .toml files are hot-reloaded by Zed
```

### Testing Changes

1. **Install as dev extension in Zed:**
   - Run command: "zed: install dev extension"
   - Select this directory

2. **Test changes:**
   - Open any `.ms` file in Zed
   - Edit query files (`.scm`) or config (`.toml`)
   - Save and Zed automatically reloads for open `.ms` files

3. **Grammar updates:**
   - Change the `rev` field in `extension.toml` to a new commit SHA
   - Get latest from: https://github.com/Nascir/tree-sitter-microscript

### File Verification

```bash
# Validate TOML syntax
brew install tomllint  # or use any TOML validator
tomllint extension.toml
tomllint languages/microscript/config.toml
```

## Code Style Guidelines

### Tree-sitter Query Files (.scm)

**General Rules:**
- Use semicolons for comments, placed on their own line
- Use lowercase for all node types and keywords
- Use snake_case for predicate names
- Sort rules logically (keywords first, then literals, then patterns)

**Syntax Highlighting (`highlights.scm`):**
- Map AST nodes to highlight groups using `@category.name` pattern
- Common categories: `@keyword`, `@operator`, `@function`, `@type`, `@variable`, `@string`, `@number`, `@comment`, `@punctuation`
- Group related keywords together using arrays
- Use specific captures for method definitions (`@function.method`) vs regular functions (`@function`)
- Lower priority for catch-all patterns (like `(identifier) @variable`)

**Indentation (`indents.scm`):**
- Use `@indent` for increasing indentation after opening brackets/keywords
- Use `@outdent` for decreasing indentation before closing brackets/keywords
- Consider `then`, `do`, `class`, `object`, `function` bodies

**Brackets (`brackets.scm`):**
- Use tree-sitter query syntax with `@open` and `@close` captures
- Define opening and closing brackets on separate lines:
  ```scm
  ("(") @open
  (")") @close
  ```
- Note: Auto-pairing is configured separately in `config.toml` using TOML format

**Outline (`outline.scm`):**
- Use `@item` to mark nodes that appear in outline
- Use `@name` for the display name (often the function/class identifier)
- Use `@context` for nested structure display

**Locals (`locals.scm`):**
- Define scope boundaries with `@local.scope`
- Mark variable definitions with `@local.definition`
- Mark variable uses with `@local.reference`

**Injections (`injections.scm`):**
- Language injection for embedding other languages (e.g., JS in `system.javascript()`)
- Use `(#set! injection.language "javascript")` predicate to specify the language
- Mark content with `@injection.content` capture

**Tags (`tags.scm`):**
- Use `@definition.function`, `@definition.method`, `@definition.class`, `@definition.object` for definitions
- Use `@reference.call` for function/method calls
- Use `@reference.class` for `new ClassName()` instantiations
- Only include patterns compatible with the microScript AST structure
- Avoid tagging nodes without `name` fields (e.g., `constructor_definition`, `property_assignment`)

### TOML Files

**Formatting:**
- Use 4-space indentation for table contents
- Use `key = "value"` format with spaces around `=`
- Use kebab-case for table and key names
- Arrays of tables: `[[array.name]]` on its own line

**Example from `config.toml`:**
```toml
name = "microScript"
grammar = "microscript"
path_suffixes = ["ms"]
line_comments = ["// "]
block_comment = ["/*", "*/"]
brackets = [
    { start = "[", end = "]", close = true, newline = true },
    { start = "(", end = ")", close = true, newline = true },
]
```

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| File extensions | `.scm`, `.toml` | `highlights.scm`, `config.toml` |
| Highlight captures | `@category.name` | `@function`, `@variable.builtin` |
| Query captures | Descriptive, snake_case | `@indent`, `@outdent`, `@item` |
| Table/field names | kebab-case | `path_suffixes`, `line_comments` |
| Comments | Semicolons, sentence case | `; Keywords - Control flow` |

## microScript Language Reference

Key syntax to support:
- Functions: `myFunc = function(args) ... end`
- Classes: `MyClass = class ... end` with `extends`
- Objects: `myObj = object ... end`
- Async: `do`, `after X seconds do`, `every X seconds do`, `sleep`
- Comments: `//` line, `/* */` block

## Common Tasks

### Adding New Syntax Highlighting

1. Identify the AST node type from tree-sitter-microscript grammar
2. Add capture rule in `highlights.scm`
3. Test with sample code containing the syntax

### Updating Grammar Version

1. Visit https://github.com/Nascir/tree-sitter-microscript
2. Find the desired commit SHA
3. Update `rev` field in `extension.toml`
4. Test highlighting on existing and new syntax

### Modifying Indentation

1. Identify the node that should trigger indent/outdent
2. Add `@indent` or `@outdent` capture in `indents.scm`
3. Consider edge cases (else/elsif after if, nested structures)

### Adding Tags for Symbol Navigation

1. Understand the AST structure by checking `/src/node-types.json` in the grammar
2. Test patterns with tree-sitter CLI: `tree-sitter query queries/tags.scm`
3. Avoid patterns for nodes without `name` fields (e.g., `constructor_definition`)
4. Test navigation in Zed: `Cmd+Shift+O` for symbol search, `Cmd+Click` for go-to-definition

## Error Handling

- Invalid query syntax will cause tree-sitter parsing failures
- Check Zed's developer tools (View > Developer > Toggle Tool Panel) for query errors
- Missing captures are logged but don't break the extension
- Test with real microScript code to verify coverage

## Known Issues & Fixes

### Function Call Highlighting (Fixed)

**Problem:** All function calls (user-defined and methods) were incorrectly highlighted in blue, making them indistinguishable from built-in functions.

**Root cause:** `highlights.scm` had catch-all rules for call expressions:
```scm
(call_expression (identifier) @function.call)
(call_expression (member_expression ... (identifier) @function.method.call))
```

**Solution:** Removed these rules from `highlights.scm`. Now only:
- Built-in API objects: `screen`, `audio`, `system`, `keyboard`, `mouse`, etc. → blue
- Built-in functions: `print`, `sqrt`, `sin`, `cos`, `random`, etc. → blue

User-defined functions and methods → no highlight (matches original microScript theme).

### Built-in Function Naming Collision (Fixed)

**Problem:** Test file defined `abs = function(n) ...` which shadows the built-in `abs()` function.

**Solution:** Renamed to `absolute = function(n) ...` in `test.ms`.

**Built-in functions to avoid shadowing:**
- Math: `abs`, `floor`, `round`, `ceil`, `sign`, `sqrt`, `pow`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2`, `sind`, `cosd`, `tand`, `asind`, `acosd`, `atand`, `log`, `log10`, `exp`, `min`, `max`
- Other: `random`, `print`
