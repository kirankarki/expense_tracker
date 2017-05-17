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
  has_many   :expenses
  after_initialize :init_values

  DEFAULT_DATE_FORMAT = '%d %b %Y'

  ##
  # Validations
  #
  validates :title, :original_amount, :start_date, :end_date, :remaining_amount, presence: true
  validates :original_amount, :remaining_amount, :extra_used_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate  :is_remaining_mount_greater_than_original_amount
  validate  :is_start_date_greater_than_end_date
  validate  :allow_to_add_extra_used_amount_only_when_remaining_amount_is_zero

  def start_date
    if read_attribute(:start_date) != nil
      read_attribute(:start_date).strftime(DEFAULT_DATE_FORMAT)
    end
  end

  def end_date
    if read_attribute(:end_date) != nil
      read_attribute(:end_date).strftime(DEFAULT_DATE_FORMAT)
    end
  end

  def init_values
    self.original_amount    ||= 0
    self.remaining_amount   ||= 0
    self.extra_used_amount  ||= 0
    self.start_date         ||= Date.current.strftime(DEFAULT_DATE_FORMAT)
    self.end_date           ||= (Date.current + 1.day ).strftime(DEFAULT_DATE_FORMAT)
  end

  private
    def is_remaining_mount_greater_than_original_amount
      if remaining_amount > original_amount
          errors.add(:remaining_amount, %q(can't be greater than original amount))
      end
    end

    def is_start_date_greater_than_end_date
      if Date.parse(start_date) > Date.parse(end_date)
        errors.add(:start_date, %q(can't be greather than end date))
      end
    end

    def allow_to_add_extra_used_amount_only_when_remaining_amount_is_zero
      if remaining_amount != 0 && extra_used_amount > 0
        errors.add(:extra_used_amount, %q(remaining amount is not zero))
      end
    end
end
