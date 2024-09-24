;extends
(field
 .
 name: (_) @array_key.inner
 .
 "=" @_end
 (#make-range! "array_key.outer" @array_key.inner @_end)
)

(
 (field
   value: (_) @array_value.inner)
 .
 ","? @_end
 (#make-range! "array_value.outer" @array_value.inner @_end)
)
