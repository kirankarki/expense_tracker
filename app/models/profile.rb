# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  display_name :string
#  phone        :string
#  dob          :date
#  city         :string
#  country      :string
#  address      :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  gender_id    :integer
#
# Indexes
#
#  index_profiles_on_gender_id  (gender_id)
#  index_profiles_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (gender_id => genders.id)
#  fk_rails_...  (user_id => users.id)
#

class Profile < ApplicationRecord
    belongs_to :user
    belongs_to :gender
end
