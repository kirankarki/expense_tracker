class AllowNullToUsernameDisplayNameEmailToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_column :users, :user_name, :string, null: true, default: ''
    change_column :users, :display_name, :string, null: true, default: ''
    change_column :users, :email, :string, null: true, default: ''
  end

  def self.down
    change_column :users, :user_name, :string, null: false, default: ''
    change_column :users, :display_name, :string, null: false, default: ''
    change_column :users, :email, :string, null: false, default: ''
  end
end
