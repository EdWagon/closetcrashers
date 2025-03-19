class ChangePriceToIntegerOnApparels < ActiveRecord::Migration[7.1]
  def change
    change_column :apparels, :price, :integer
  end
end
