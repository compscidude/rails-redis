class ChangeScoreIntegerToDecimal < ActiveRecord::Migration[5.0]
  def change
      change_column :Users, :score, :float
  end
end
