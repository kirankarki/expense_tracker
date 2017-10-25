# == Schema Information
#
# Table name: frequencies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Frequency < ApplicationRecord
    has_many :incomes
    has_many :savings
end
