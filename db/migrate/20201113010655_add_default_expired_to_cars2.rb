class AddDefaultExpiredToCars2 < ActiveRecord::Migration[6.0]
  def change
    change_column :cars, :expired, :boolean, default: false
  end
end
