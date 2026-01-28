# microScript for Zed

Adds [microScript](https://github.com/pmgl/microstudio/wiki) language support to [Zed](https://zed.dev).

## Features

- microScript syntax highlightning 
- Bracket matching (`()`, `[]`)
- Auto-pairing for brackets (`()`, `[]`) and quotes (`""`, `''`)
- Code block matching (`function...end`, `while...end`, `for...end`)
- Code folding
- Code outline and symbol navigation
- JavaScript syntax highlightning for `system.javascript()` calls

## Known Limitations

Block matching for `if...end` is not supported.

## Install

Search for "microScript" in Zed's extension panel.

## Grammar

Uses [tree-sitter-microscript](https://github.com/Nascir/tree-sitter-microscript).

## License

MIT
