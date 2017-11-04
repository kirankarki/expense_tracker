json.extract! profile, :id, :display_name, :phone, :dob, :city, :country, :address, :gender_id, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
