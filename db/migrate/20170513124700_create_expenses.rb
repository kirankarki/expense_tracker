class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.text :description
      t.integer :amount
      t.string :spent_date
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
