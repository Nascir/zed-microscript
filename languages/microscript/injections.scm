; Injections for embedded languages in microScript

; JavaScript embedding via system.javascript()
; Example: system.javascript("console.log('hello')")
; Note: triple_quoted_string is nested inside string, so we just match string
(call_expression
  (member_expression
    (identifier) @_obj
    (identifier) @_method)
  (argument_list
    (string) @injection.content)
  (#eq? @_obj "system")
  (#eq? @_method "javascript")
  (#set! injection.language "javascript")
  (#set! injection.include-children))
