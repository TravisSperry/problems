json.array!(@project_fields) do |project_field|
  json.extract! project_field, :id
  json.url project_field_url(project_field, format: :json)
end
