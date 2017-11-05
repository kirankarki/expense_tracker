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

class Profile < ApplicationRecord
    include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute

    ##
    # Relationships
    #
    belongs_to :user
    belongs_to :gender

    ##
    # Validations
    #
    validates :first_name, presence: true

    def display_name
        self.first_name || self.last_name || self.middle_name
    end

    def full_name
        full_name = self.first_name
        full_name << " #{self.middle_name}" if self.middle_name.present?
        full_name << " #{self.last_name}" if self.last_name.present?
        full_name
    end

    def city_and_country
        city_country = ''
        city_country << "#{self.city}, " if self.city.present?
        city_country << "#{self.country}" if self.country.present?

    end
end
