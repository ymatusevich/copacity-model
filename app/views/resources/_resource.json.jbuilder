json.extract! resource, :id, :first_name, :last_name, :email, :resource_type_id, :general_capacity, :created_at, :updated_at
json.url resource_url(resource, format: :json)
