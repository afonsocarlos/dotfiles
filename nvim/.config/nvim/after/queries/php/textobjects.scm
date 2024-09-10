; extends
(
  (comment) * @_start
  .
  [
    (function_definition)
    (anonymous_function)
    (method_declaration)
  ] @_end
  (#make-range! "function.full" @_start @_end)
)
