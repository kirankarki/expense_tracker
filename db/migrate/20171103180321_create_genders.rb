class CreateGenders < ActiveRecord::Migration[5.1]
  def up
    create_table :genders do |t|
      t.string :name

      t.timestamps
    end

    %w[male female gay lesbian homosexual other].each do |name|
      g = Gender.new(name: name)
      g.save
    end

    add_reference :profiles, :gender, foreign_key: true
  end

  def down
    # Drop the foreign_key assoications first and then drop the parent table.
    remove_column :profiles, :gender_id
    drop_table :genders
  end
end
