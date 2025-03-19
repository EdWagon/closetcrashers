class CreateFits < ActiveRecord::Migration[7.1]
  def change
    create_table :fits do |t|
      t.string :name

      t.timestamps
    end
  end
end
