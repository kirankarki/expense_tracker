class AddImageToProfile < ActiveRecord::Migration[5.1]
  def up
    add_column :profiles, :image_data, :text
  end
  def down
    remove_column :profiles, :image_data
  end
end
