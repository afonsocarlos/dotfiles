; extends
(
  (comment)* @_start
  .
  [
    (function_definition)
    (anonymous_function)
    (method_declaration)
  ] @_end
  (#make-range! "function.full" @_start @_end)
)

(
 (array_element_initializer
   (_) @array_key.inner
   "=>" @_end
 )
 (#make-range! "array_key.outer" @array_key.inner @_end)
)

(
 (array_element_initializer
   "=>"
   (_) @array_value.inner
   )
 ","? @_end
 (#make-range! "array_value.outer" @array_value.inner @_end)
)
