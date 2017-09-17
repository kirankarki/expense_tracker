# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  user_name              :string           default("")
#  display_name           :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter facebook google_oauth2]

  has_many :budgets, dependent: :destroy

  # Override devise's default validation rules
  def email_required?
    if self.provider.blank? || self.uid.blank?
      true
    else
      false
    end
  end

  def self.omniauth_login_or_create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create! do | user |
      password      = Devise.friendly_token[0, 20]
      general_info  = get_general_info(provider_data)

      user.user_name              = general_info[:user_name]
      user.display_name           = general_info[:display_name]
      user.email                  = general_info[:email]
      user.password               = password
      user.password_confirmation  = password

      #user.skip_confirmation!
    end
  end

  # Get name, username and email for social provider data
  def self.get_general_info(provider_data)
    sliced_data = {}
    unless provider_data.blank?
      Rails.logger.info "Provider_data: #{provider_data}"
      case provider_data.provider # Twitter, Facebook and Google
      when 'twitter'
        sliced_data[:user_name] = provider_data.dig(:info, :nickname)
      when 'facebook'
        sliced_data[:user_name] = provider_data.dig(:info, :extra, :raw_info, :username)
      end
      sliced_data[:display_name]  = provider_data.dig(:info, :name)
      sliced_data[:email]         = provider_data.dig(:info, :email)
    end
    Rails.logger.info "Sliced_data: #{sliced_data}"
    sliced_data
  end
end
