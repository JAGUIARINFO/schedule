json.extract! booking, :id, :user_id, :datareserva, :horareserva, :descricao, :created_at, :updated_at
json.url booking_url(booking, format: :json)
