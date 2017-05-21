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
  after_initialize :init_values
  after_commit :update_budget_remaining_amount

  DEFAULT_DATE_FORMAT = '%d %b %Y'

  ##
  # Validations
  #
  validates :title, :amount, :spent_date, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2147483647 }

  def spent_date
    if read_attribute(:spent_date) != nil
      read_attribute(:spent_date).strftime(DEFAULT_DATE_FORMAT)
    end
  end

  private
    def init_values
      self.amount     ||= 0
      self.spent_date ||= Date.current.strftime(DEFAULT_DATE_FORMAT)
    end

    def update_budget_remaining_amount
      total_spent_amount = Expense.where(budget_id: self.budget_id)
                            .pluck(:amount)
                            .inject(0) do |result, value|
                                result+value
                              end
      original_amount    = self.budget.original_amount
      remaining_amount   = 0
      extra_spent_amount = 0

      if original_amount >=  total_spent_amount
        remaining_amount  = original_amount - total_spent_amount
      elsif original_amount < total_spent_amount
        extra_spent_amount = total_spent_amount - original_amount
      end

      self.budget.update(remaining_amount: remaining_amount, extra_used_amount: extra_spent_amount)
    end
end
