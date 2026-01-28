; Indent after block-starting constructs
(conditional_expression) @indent
(elsif_clause) @indent
(else_clause) @indent
(while_statement) @indent
(for_statement) @indent
(for_in_statement) @indent
(function_definition) @indent
(class_definition) @indent
(object_definition) @indent
(constructor_definition) @indent
(method_definition) @indent
(do_block) @indent
(after_block) @indent
(every_block) @indent
(anonymous_function) @indent

; End keyword decreases indent
("end") @outdent

; Else/elsif keywords outdent to align with if, then indent their bodies
("else") @outdent
("elsif") @outdent

; Bracket-based indentation (node-based)
(list_literal "]" @end) @indent
(subscript_expression "]" @end) @indent
