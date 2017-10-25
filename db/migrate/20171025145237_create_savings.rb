class CreateSavings < ActiveRecord::Migration[5.0]
  def up
    create_table :savings do |t|
      t.references :user, foreign_key: true
      t.references :frequency, foreign_key: true
      t.string :title
      t.text :description
      t.integer :amount
      t.date :saved_date

      t.timestamps
    end
  end

  def down
    drop_table :savings
  end
end
