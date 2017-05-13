# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  amount      :integer
#  spent_date  :date
#  budget_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_expenses_on_budget_id  (budget_id)
#
# Foreign Keys
#
#  fk_rails_95fd19c298  (budget_id => budgets.id)
#

class Expense < ApplicationRecord
  belongs_to :budget
end
