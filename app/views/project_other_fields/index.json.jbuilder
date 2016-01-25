json.array!(@project_other_fields) do |project_other_field|
  json.extract! project_other_field, :id
  json.url project_other_field_url(project_other_field, format: :json)
end
