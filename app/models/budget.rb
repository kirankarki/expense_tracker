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

class Budget < ApplicationRecord
  belongs_to :user
  has_many   :expenses, dependent: :destroy
  after_initialize :init_values

  DEFAULT_DATE_FORMAT = '%d %b %Y'

  attr_reader :total_spent_expense

  ##
  # Customize the pagination's default page value
  #
  self.per_page = 10

  ##
  # Validations
  #
  validates :title, :original_amount, :start_date, :end_date, presence: true
  validates :original_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2147483647 }
  validate  :is_start_date_greater_than_end_date

  ##
  # Callbacks
  #
  after_update :recalculate_remaining_extra_used_amounts, if: :original_amount_changed?

  ##
  # Elasticsearch 
  #
  searchkick callbacks: :async

  def search_data 
    {
      title: title,
      description: description
    }
  end


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

  def is_expired?
    if Date.current <= Date.parse(self.end_date)
      false
    elsif Date.current > Date.parse(self.end_date)
      true
    end
  end

  def total_spent_expense
    total_spent_amount  = 0
    expenses            = self.expenses

    if self.expenses.count > 0
      total_spent_amount = expenses.sum(:amount)
    end

    total_spent_amount
  end

  private
    def init_values
      self.original_amount    ||= 0
      self.remaining_amount   ||= 0
      self.extra_used_amount  ||= 0
      self.start_date         ||= Date.current.strftime(DEFAULT_DATE_FORMAT)
      self.end_date           ||= (Date.current + 1.day ).strftime(DEFAULT_DATE_FORMAT)
    end

    def is_start_date_greater_than_end_date
      if Date.parse(start_date) > Date.parse(end_date)
        errors.add(:start_date, %q(can't be greather than end date))
      end
    end

    def recalculate_remaining_extra_used_amounts
      total_spent_amount = total_spent_expense
      
      if total_spent_amount > 0
        original_amount    = self.original_amount
        remaining_amount   = 0
        extra_spent_amount = 0

        if original_amount >= total_spent_amount
          remaining_amount  = original_amount - total_spent_amount
        elsif original_amount < total_spent_amount
          extra_spent_amount = original_amount - total_spent_amount
        end

        self.update_columns(remaining_amount: remaining_amount, extra_used_amount: extra_spent_amount)
      end
    end
end
