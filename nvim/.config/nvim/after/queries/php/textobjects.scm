;; function.full: docblock + function
(
  (comment) * @_start
  .
  [
    (function_definition)
    (anonymous_function_creation_expression)
    (method_declaration)
  ] @_end
  (#make-range! "function.full" @_start @_end)
)
