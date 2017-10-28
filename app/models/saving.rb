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

class Saving < ApplicationRecord
  belongs_to :user
  belongs_to :frequency

  DEFAULT_DATE_FORMAT = '%d %b %Y'.freeze

  ##
  # Callbacks
  #
  after_initialize :init_values

  ##
  # Validations
  #
  validates :title, :amount, :saved_date, :frequency_id, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2147483647 }

  ##
  # Elasticsearch
  #
  searchkick callbacks: :async

  def search_data
    {
      title: title,
      description: description,
      frequency: self.frequency.name
    }
  end

  private
  def init_values
    self.amount     ||= 0
    self.saved_date ||= Date.current.strftime(DEFAULT_DATE_FORMAT)
  end
end
