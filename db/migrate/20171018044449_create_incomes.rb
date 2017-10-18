class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.string :title
      t.text :description
      t.integer :amount
      t.date :received_date
      t.references :user, foreign_key: true
      t.references :frequency, foreign_key: true

      t.timestamps
    end
  end
end
