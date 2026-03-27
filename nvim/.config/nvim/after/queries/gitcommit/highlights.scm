;; extends
((subject) @comment
  (#vim-match? @comment ".\{50,}")
  (#offset! @comment 0 50 0 0))

((message_line) @comment
  (#vim-match? @comment ".\{72,}")
  (#offset! @comment 0 72 0 0))

