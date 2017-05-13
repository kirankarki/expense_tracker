json.extract! budget, :id, :title, :description, :original_amount, :start_date, :end_date, :remaining_amount, :user_id, :created_at, :updated_at
json.url budget_url(budget, format: :json)
