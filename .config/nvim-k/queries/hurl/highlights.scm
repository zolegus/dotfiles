[
  "GET"
  "POST"
  "PUT"
  "DELETE"
  "CONNECT"
  "OPTIONS"
  "TRACE"
  "PATCH"
  "LINK"
  "UNLINK"
  "PURGE"
  "LOCK"
  "UNLOCK"
  "PROPFIND"
  "VIEW"
 ] @keyword

[
 (url)
] @string

[
 (response)
] @keyword.response

[
 (status_code_pattern)
] @constant

(comment) @comment

(assert_literal) @constant.buildin
