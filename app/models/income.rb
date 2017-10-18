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
#  fk_rails_1628635902  (frequency_id => frequencies.id)
#  fk_rails_e53b3fa7c7  (user_id => users.id)
#

class Income < ApplicationRecord
  belongs_to :user
  belongs_to :frequency
end
