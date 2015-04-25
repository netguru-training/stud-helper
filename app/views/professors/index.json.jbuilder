json.array!(@professors) do |professor|
  json.extract! professor, :id, :first_name, :last_name, :title
  json.url professor_url(professor, format: :json)
end
