json.array!(@project_attachment_types) do |project_attachment_type|
  json.extract! project_attachment_type, :id, :name
  json.url project_attachment_type_url(project_attachment_type, format: :json)
end
