# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  phone       :string
#  dob         :date
#  city        :string
#  country     :string
#  address     :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gender_id   :integer
#  image_data  :text
#  first_name  :string
#  middle_name :string
#  last_name   :string
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

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
