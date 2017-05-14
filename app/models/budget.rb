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
#  fk_rails_e708f32fd8  (user_id => users.id)
#

class Budget < ApplicationRecord
  belongs_to :user
  after_initialize :init_values

  def init_values
    default_date_format   = '%d %b %Y'

    self.original_amount    ||= 0
    self.remaining_amount   ||= 0
    self.extra_used_amount  ||= 0
    self.start_date         ||= Date.current.strftime(default_date_format)
    self.end_date           ||= (Date.current + 1.day ).strftime(default_date_format)
  end
end
