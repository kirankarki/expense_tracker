class AddExtraUsedAmountColumnToBudgets < ActiveRecord::Migration[5.0]
  def change
    add_column :budgets, :extra_used_amount, :integer
  end
end
