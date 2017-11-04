class AddFullNameColumnToProfile < ActiveRecord::Migration[5.1]
  def up
    add_column :profiles, :first_name, :string
    add_column :profiles, :middle_name, :string
    add_column :profiles, :last_name, :string

    remove_column :profiles, :display_name
  end
  def down
    add_column :profiles, :display_name, :string

    remove_column :profiles, :first_name
    remove_column :profiles, :middle_name
    remove_column :profiles, :last_name
  end
end
