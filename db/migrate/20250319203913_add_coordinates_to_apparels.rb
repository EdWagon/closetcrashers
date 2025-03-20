class AddCoordinatesToApparels < ActiveRecord::Migration[7.1]
  def change
    add_column :apparels, :latitude, :float
    add_column :apparels, :longitude, :float
  end
end
