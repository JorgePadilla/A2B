json.extract! trip, :id, :user_id, :origin, :destiny, :start_date, :start_time, :end_date, :end_time, :created_at, :updated_at
json.url trip_url(trip, format: :json)
