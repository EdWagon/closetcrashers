class CreateApparels < ActiveRecord::Migration[7.1]
  def change
    create_table :apparels do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :address
      t.references :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
