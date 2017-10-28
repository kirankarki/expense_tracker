# == Schema Information
#
# Table name: savings
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  frequency_id :integer
#  title        :string
#  description  :text
#  amount       :integer
#  saved_date   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_savings_on_frequency_id  (frequency_id)
#  index_savings_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (frequency_id => frequencies.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class SavingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
