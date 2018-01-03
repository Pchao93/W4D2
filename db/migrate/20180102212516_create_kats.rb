class CreateKats < ActiveRecord::Migration[5.1]
  def change
    create_table :kats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false, limit: 1
      t.text :description, null: false
      t.timestamps
    end
    add_index :kats, :birth_date
  end
end
