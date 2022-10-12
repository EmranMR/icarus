; Preprocessor
(preproc_if
  [
    "#if"
    "#endif"
  ] @processing.directive
  condition: (identifier) @processing.directive)
(preproc_elif
  "#elif" @processing.directive
  condition: (identifier) @processing.directive)
(preproc_else
  "#else" @processing.directive)
(preproc_ifdef
  [
    "#ifdef"
    "#ifndef"
  ] @processing.directive
  name: (identifier) @processing.directive)
(preproc_ifdef
  "#endif" @processing.directive)
(preproc_def
  "#define" @processing.directive
  name: (identifier) @processing.directive)
(preproc_call
  directive: (preproc_directive) @processing.directive
  argument: (preproc_arg) @processing.directive)

; Functions

(call_expression
  function: (qualified_identifier
    name: (identifier) @identifier.function))
(call_expression
  function: (identifier) @identifier.function)
(call_expression
  function: (field_expression
    field: (field_identifier) @identifier.function))
(field_expression
  argument: (field_expression
    field: (field_identifier) @identifier.property))

(template_function
  name: (identifier) @identifier.function)

(template_method
  name: (field_identifier) @identifier.function)

(template_function
  name: (identifier) @identifier.function)

(function_declarator
  declarator: (qualified_identifier
    name: (identifier) @identifier.function))

(function_declarator
  declarator: (qualified_identifier
    name: (identifier) @identifier.function))

(function_declarator
  declarator: (field_identifier) @identifier.function)
  
(function_declarator
  declarator: (identifier) @identifier.function)

(destructor_name (identifier) @identifier.function)

(field_declaration
  declarator: (field_identifier) @identifier.property)

; Types

(qualified_identifier 
  scope: (namespace_identifier) @identifier.type)

(type_descriptor
  (qualified_identifier 
    name: (type_identifier) @identifier.type))

((namespace_identifier) @identifier.type
 (#match? @identifier.type "^[A-Z]"))

(namespace_definition
  name: (identifier) @identifier.type)

(type_identifier) @identifier.type
(primitive_type) @identifier.type

(auto) @keyword.modifier
(type_qualifier) @keyword.modifier
(storage_class_specifier) @keyword.modifier

(template_argument_list (identifier) @identifier.type)

; Literals

(number_literal) @value.number
[
  (true)
  (false)
] @value.boolean
(this) @keyword.self
(nullptr) @value.null

; Operators

[
  "~"
  ":"
  "::"
  "--"
  "-"
  "-="
  "->"
  "="
  "!="
  "*"
  "&"
  "&&"
  "+"
  "++"
  "+="
  "<"
  "=="
  ">"
  "||"
  "<="
  ">="
  "<<"
  ">>"
  "!"
  "."
] @operator

; Keywords

[
 "catch"
 "class"
 "co_await"
 "co_return"
 "co_yield"
 "constexpr"
 "constinit"
 "consteval"
 "delete"
 "explicit"
 "final"
 "friend"
 "mutable"
 "namespace"
 "noexcept"
 "new"
 "override"
 "private"
 "protected"
 "public"
 "template"
 "throw"
 "try"
 "typename"
 "using"
 "virtual"
 "concept"
 "requires"
 "return"
 "do"
 "if"
 "else"
 "while"
 "for"
] @keyword

; Preprocessor

(preproc_include) @declaration.include

; Strings

(string_literal) @string
(raw_string_literal) @string

; Comments

(comment) @comment