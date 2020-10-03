json.extract! expense, :id, :user_id, :date, :usage, :amount, :people, :description, :status, :created_at, :updated_at
json.url expense_url(expense, format: :json)
