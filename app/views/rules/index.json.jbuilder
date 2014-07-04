json.array!(@rules) do |rule|
  json.extract! rule, :name, :statement
  json.url rule_url(rule, format: :json)
end