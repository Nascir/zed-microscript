; Bracket pairs
("(" @open ")" @close)
("[" @open "]" @close)

; Keyword blocks
(function_definition "function" @open "end" @close)
(while_statement "while" @open "end" @close)
(for_statement "for" @open "end" @close)
(for_in_statement "for" @open "end" @close)
(do_block "do" @open "end" @close)
(class_definition "class" @open "end" @close)
(object_definition "object" @open "end" @close)
(anonymous_function "function" @open "end" @close)
(constructor_definition "function" @open "end" @close)
(method_definition "function" @open "end" @close)
(after_block "after" @open "end" @close)
(every_block "every" @open "end" @close)
