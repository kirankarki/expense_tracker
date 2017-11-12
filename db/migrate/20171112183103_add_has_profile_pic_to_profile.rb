class AddHasProfilePicToProfile < ActiveRecord::Migration[5.1]
  def up
    add_column :profiles, :has_profile_pic, :boolean, default: false
    Profile.all.each{ |p| 
      if p.image.present?
        unless p.image[:original].original_filename == 'default.png'
          p.has_profile_pic = true
          p.save
        end
      end
    }
  end
  def down
    remove_column :profiles, :has_profile_pic
  end
end
