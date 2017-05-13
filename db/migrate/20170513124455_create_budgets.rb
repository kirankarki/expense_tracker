class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.string :title
      t.text :description
      t.integer :original_amount
      t.date :start_date
      t.date :end_date
      t.string :remaining_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
