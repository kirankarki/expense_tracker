json.extract! expense, :id, :title, :description, :amount, :spent_date, :budget_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
