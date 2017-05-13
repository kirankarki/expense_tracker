class ChangeFromStringToDateFormatToSpentDateOfExpense < ActiveRecord::Migration[5.0]
  def self.up
    change_column :expenses, :spent_date, 'date USING spent_date::date'
  end

  def self.down
    change_column :expenses, :spent_date, :string
  end

end
