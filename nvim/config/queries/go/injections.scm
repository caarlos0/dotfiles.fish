; extends
; inject sql into any const string with word query in the name
; e.g. const query = `SELECT * FROM users WHERE name = 'John'`;
(const_spec
  name: (identifier) @_name (#match? @_name "[Q|q]uery")
  value: (expression_list
    (raw_string_literal) @sql)
    (#offset! @sql 0 1 0 -1))

; inject sql in single line strings
(call_expression
  (selector_expression
    field: (field_identifier) @_field (#any-of? @_field "GetContext" "ExecContext" "SelectContext"))
  (argument_list
    (interpreted_string_literal) @sql)
    (#offset! @sql 0 1 0 -1)) ; wtf does this do?

; inject sql in multi line strings
(call_expression
  (selector_expression
    field: (field_identifier) @_field (#any-of? @_field "GetContext" "ExecContext" "SelectContext"))
  (argument_list
    (raw_string_literal) @sql)
    (#offset! @sql 0 1 0 -1)) ; wtf does this do?

