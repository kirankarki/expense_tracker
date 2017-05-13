# == Schema Information
#
# Table name: budgets
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  original_amount  :integer
#  start_date       :date
#  end_date         :date
#  remaining_amount :string
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_budgets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_e708f32fd8  (user_id => users.id)
#

class Budget < ApplicationRecord
  belongs_to :user
end
