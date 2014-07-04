json.array!(@posts) do |post|
  json.extract! post, :content, :rule_id
  json.url post_url(post, format: :json)
end