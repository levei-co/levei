json.extract! reverse, :id, :user_id, :order_id, :status, :reason, :created_at, :updated_at
json.url reverse_url(reverse, format: :json)
