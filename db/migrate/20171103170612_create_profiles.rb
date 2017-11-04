class CreateProfiles < ActiveRecord::Migration[5.1]
  def up
    create_table :profiles do |t|
      t.string :display_name
      t.integer :phone
      t.date :dob
      t.string :city
      t.string :country
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end

    # Create new profile for each user and set user's display_name to display_name column of profile model.
    User.all.each do |user|
      profile               = Profile.new
      profile.user_id       = user.id
      profile.display_name  = user.display_name
      profile.save!
    end

    remove_column :users, :display_name
  end

  def down
    add_column :users, :display_name, :string

    Profile.all.each do |profile|
      if user=profile.user
        user.display_name = profile.display_name
        user.save!
      end
    end

    remove_table :profiles
  end
end
