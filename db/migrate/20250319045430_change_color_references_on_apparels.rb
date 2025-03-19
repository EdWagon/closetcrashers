class ChangeColorReferencesOnApparels < ActiveRecord::Migration[7.1]
  def change
    change_column_null :apparels, :color_id, true
  end
end
