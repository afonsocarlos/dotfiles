;extends
(
  [
    (function_definition)
  ]
) @function.full

(
  (
    (table_constructor
      (field
        .
        (identifier) @array_key.inner
        "="
        (_) @array_value.inner
      )
    )
  )
)

(
  (table_constructor
    (field
      .
      (identifier) @array_key.outer
      "=" @array_key.outer
      (_) @array_value.outer
    ) ","? @array_value.outer
  )
)
