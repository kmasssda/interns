json.array!(@questions) do |question|
  json.extract! question, :id, :title, :description, :user_id, :answer_id
  json.url question_url(question, format: :json)
end
