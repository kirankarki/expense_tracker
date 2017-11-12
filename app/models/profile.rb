# == Schema Information
#
# Table name: profiles
#
#  id              :integer          not null, primary key
#  phone           :string
#  dob             :date
#  city            :string
#  country         :string
#  address         :string
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gender_id       :integer
#  image_data      :text
#  first_name      :string
#  middle_name     :string
#  last_name       :string
#  has_profile_pic :boolean          default(FALSE)
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
    # Callbacks
    #
    before_commit :check_and_set_image, on: [:create, :update]

    ##
    # Validations
    #
    validates :first_name, presence: true
    

    def display_name
        self.first_name || self.last_name || self.middle_name
    end

    def full_name
        name = self.first_name
        name += " #{self.middle_name}" if self.middle_name.present?
        name += " #{self.last_name}" if self.last_name.present?
    end

    def city_and_country
        city_country = ''
        if self.city.present? && self.country.present?
            city_country = "#{self.city}, #{self.country}"
        elsif self.city.present?
            city_country = self.city
        elsif self.country.present?
            city_country = self.country
        end
        city_country
    end

    private
    def check_and_set_image
        if !self.image.present?
            self.has_profile_pic = false
            self.image = File.open(Rails.root + 'app/assets/images/' + ['default.png'].compact.join('_'))
        else
            self.has_profile_pic = true
        end
    end
end
