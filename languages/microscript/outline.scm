; Outline queries for microScript
; Shows functions, classes, objects, methods in Zed's outline panel

; Function definitions
(function_definition
  name: (identifier) @name) @item

; Class definitions
(class_definition
  name: (identifier) @name
  "class" @context) @item

; Object definitions
(object_definition
  name: (identifier) @name
  "object" @context) @item

; Method definitions inside classes/objects
(method_definition
  name: (identifier) @name) @item

; Method definitions with string names (operator overloading)
(method_definition
  name: (string) @name) @item

; Constructor definitions inside classes
(constructor_definition
  "constructor" @name
  "=" @context) @item
