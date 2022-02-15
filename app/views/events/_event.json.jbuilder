json.extract! event, :id, :scheduled_on, :place, :title, :content, :created_at, :updated_at
json.url event_url(event, format: :json)
