json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :short_name, :description
  json.url subject_url(subject, format: :json)
end
