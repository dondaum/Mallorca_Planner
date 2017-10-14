json.extract! reservation, :id, :title, :start_date, :end_date, :comment, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
