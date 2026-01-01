; Keywords - Control flow
[
  "if"
  "elsif"
  "else"
  "then"
  "end"
  "return"
] @keyword

; Keywords - Loops
[
  "while"
  "for"
  "to"
  "by"
  "in"
] @keyword

; Break and continue statements
(break_statement) @keyword
(continue_statement) @keyword

; Keywords - Logical operators (violet)
[
  "and"
  "or"
  "not"
] @keyword.control

; Keywords - Functions and OOP
[
  "function"
  "class"
  "constructor"
  "extends"
  "new"
  "object"
] @keyword

; Keywords - Scope
[
  "local"
] @keyword

; Keywords - Async/scheduling
[
  "do"
  "after"
  "every"
  "sleep"
] @keyword

; Keywords - Delete
[
  "delete"
] @keyword

; Built-in values
(this) @variable.builtin
(super) @variable.builtin

; Global namespace (like this/super)
((identifier) @variable.builtin
  (#eq? @variable.builtin "global"))

; Built-in API objects (modules/namespaces)
((identifier) @function.builtin
  (#any-of? @function.builtin
    "screen" "keyboard" "mouse" "touch" "gamepad"
    "audio" "system" "storage" "asset_manager"
    "sprites" "maps" "fonts"))

; Literals
(number) @number
(string) @string
(triple_quoted_string) @string
(string_content) @string
(escape_sequence) @string.escape
(boolean) @constant.builtin

; Comments
(comment) @comment

; Operators - Arithmetic
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "^"
] @operator

; Operators - Comparison
[
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
] @operator

; Operators - Bitwise
[
  "&"
  "|"
  "<<"
  ">>"
] @operator

; Operators - Assignment
[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
] @operator

; Punctuation - Brackets
[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

; Punctuation - Delimiters
[
  ","
  "."
] @punctuation.delimiter

; Built-in function calls (math, etc.)
(call_expression
  (identifier) @function.builtin
  (#any-of? @function.builtin
    "floor" "round" "ceil" "abs" "sign" "sqrt" "pow"
    "sin" "cos" "tan" "asin" "acos" "atan" "atan2"
    "sind" "cosd" "tand" "asind" "acosd" "atand"
    "log" "log10" "exp" "min" "max" "random" "print"))

; Parameters
(parameter
  (identifier) @variable.parameter)

; Member access - the property is the identifier after the dot
(member_expression
  "." @punctuation.delimiter
  (identifier) @property)

; Variables (catch-all, lower priority)
; (identifier) @variable

; Syntax errors
(ERROR) @error
