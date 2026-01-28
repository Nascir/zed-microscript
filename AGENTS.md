# AGENTS.md

This file provides guidelines for agents working on the microScript Zed extension.

## Project Overview

This is a [Zed editor](https://zed.dev) extension that adds microScript language support. The extension uses a tree-sitter grammar and provides:
- Syntax highlighting
- Code folding and bracket matching
- Auto-pairing for brackets and quotes
- Code outline and symbol navigation
- JavaScript injection for `system.javascript()` calls

## Build, Lint, and Test Commands

**Testing Changes (Manual):**

Zed extensions have no traditional build process. The tree-sitter grammar is compiled separately at https://github.com/Nascir/tree-sitter-microscript.

```bash
# To test changes:
# 1. Reload extension: Cmd+Shift+P > "Extensions: Reload"
# 2. Open a .ms file to verify syntax highlighting and features
# 3. Check Zed extension panel for error logs
# 4. Use test.ms file for verification
```

**Grammar Updates:**

When AST nodes change, update `extension.toml` with the new commit hash and download the `.wasm` file.

## Code Style Guidelines

### Tree-Sitter Query Files (.scm)

**File Purposes:**
- `highlights.scm` - Syntax highlighting
- `tags.scm` - Symbol navigation
- `outline.scm` - Code structure
- `indents.scm` - Indentation rules
- `brackets.scm` - Bracket/block matching
- `injections.scm` - Language injection
- `locals.scm` - Scoping information

**Capture Naming Conventions:**
```
@keyword        - Language keywords
@function       - Function calls
@definition.*   - Symbol definitions (function, class, method)
@variable       - Variables
@property       - Object properties
@parameter      - Function parameters
@error          - Syntax errors
@builtin        - Built-in functions
```

**Formatting Rules:**
```scheme
; Good: grouped with comments, 4-space indent
(function_definition
    name: (identifier) @name) @definition.function

; Bad: compressed, no structure
(function_definition name: (identifier) @name) @definition.function
```

- Use 4-space indentation within captures
- One capture per line for complex patterns
- Blank lines between pattern groups
- More specific patterns before general ones
- Full-line semicolon comments for logical groups

**Common Errors to Avoid:**
- Impossible patterns: `(node "token" @end)` only works if token is a named child
- Always verify AST structure in `grammars/microscript/src/node-types.json`
- Test patterns individually before combining

### TOML Configuration Files

**Files:**
- `extension.toml` - Metadata and grammar reference
- `languages/microscript/config.toml` - Language settings

**Formatting:**
```toml
name = "microScript"
grammar = "microscript"
path_suffixes = ["ms"]
line_comments = ["// "]

[brackets]
# 4-space indent for nested tables
```

## Zed Extension Development Notes

**Key Principles:**
- Zed uses tree-sitter; no custom parser
- All features defined via tree-sitter queries
- No JavaScript/TypeScript in this extension
- `.wasm` handles parsing; `.scm` files interpret AST
- Changes require extension reload

**Common Issues:**
- `Query error at X: Impossible pattern` - Token is not a named child in AST
- `failed to load language` - Syntax error in query file
- `missing required captures: indent` - No @indent capture found

**Testing Checklist:**
- [ ] Extension reloads without errors
- [ ] Syntax highlighting works for all node types
- [ ] Bracket matching highlights correct pairs
- [ ] Indentation applies correctly (check with test.ms)
- [ ] No errors in Zed extension panel

## File Structure

```
microscript_zed_extension/
├── AGENTS.md              # This file
├── extension.toml         # Metadata
├── README.md              # User docs
├── grammars/
│   ├── microscript.wasm   # Grammar binary
│   └── microscript/       # Grammar source
├── languages/microscript/
│   ├── config.toml        # Language config
│   ├── highlights.scm     # Syntax highlighting
│   ├── tags.scm           # Symbol navigation
│   ├── outline.scm        # Code outline
│   ├── indents.scm        # Indentation
│   ├── brackets.scm       # Bracket matching
│   ├── injections.scm     # Language injection
│   └── locals.scm         # Scoping
└── test.ms                # Test file
```

## Common Tasks Quick Reference

| Task | File | Key Captures |
|------|------|--------------|
| Add highlighting | highlights.scm | @keyword, @function, @variable |
| Add navigation | tags.scm | @definition.function, @reference |
| Fix indentation | indents.scm | @indent, @outdent, @end |
| Add block matching | brackets.scm | @open, @close |
| Add injection | injections.scm | @injection |

## Important Notes

1. **Always verify AST structure** before writing query patterns
2. **Test changes incrementally** - reload after each modification
3. **Check Zed logs** for errors when something doesn't work
4. **Grammar changes** require updating `extension.toml` commit hash
5. **No automated tests** exist - all verification is manual through Zed
