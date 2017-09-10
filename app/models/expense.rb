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
  after_commit :update_budget_remaining_and_extra_used_amounts

  DEFAULT_DATE_FORMAT = '%d %b %Y'

  ##
  # Customize the pagination's default page value
  #
  self.per_page = 10

  ##
  # Validations
  #
  validates :title, :amount, :spent_date, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2147483647 }

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

    def update_budget_remaining_and_extra_used_amounts
      self.budget.send(:recalculate_remaining_extra_used_amounts)
    end
end
