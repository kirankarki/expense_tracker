# == Schema Information
#
# Table name: budgets
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  original_amount   :integer
#  start_date        :date
#  end_date          :date
#  remaining_amount  :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  extra_used_amount :integer
#
# Indexes
#
#  index_budgets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
