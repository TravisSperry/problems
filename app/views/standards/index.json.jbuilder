json.array!(@standards) do |standard|
  json.extract! standard, :id, :code, :category, :subcategory
  json.url standard_url(standard, format: :json)
end
