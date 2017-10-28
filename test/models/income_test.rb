# == Schema Information
#
# Table name: incomes
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  amount        :integer
#  received_date :date
#  user_id       :integer
#  frequency_id  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_incomes_on_frequency_id  (frequency_id)
#  index_incomes_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (frequency_id => frequencies.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
