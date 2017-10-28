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
#  fk_rails_...  (budget_id => budgets.id)
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
