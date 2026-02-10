; extends
(
  (comment)*
  .
  [
    (function_definition)
    (anonymous_function)
    (method_declaration)
  ]
) @function.full

(
  (array_element_initializer
    (_) @array_key.inner
    "=>"
    (_) @array_value.inner
  )
)

(
  (array_element_initializer
    .
    _+ @array_key.outer
    (_) @array_value.outer
  )","? @array_value.outer
)
