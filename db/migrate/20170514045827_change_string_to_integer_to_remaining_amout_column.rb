class ChangeStringToIntegerToRemainingAmoutColumn < ActiveRecord::Migration[5.0]
  def self.up
    change_column :budgets, :remaining_amount, 'integer USING remaining_amount::integer'
  end
  def self.down
    change_column :budgets, :remaining_amount, :string
  end
end
