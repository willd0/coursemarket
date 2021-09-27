json.extract! lesson, :id, :name, :lesson_id, :lesson_number, :lesson_text, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
