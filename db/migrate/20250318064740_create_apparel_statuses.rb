class CreateApparelStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :apparel_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
