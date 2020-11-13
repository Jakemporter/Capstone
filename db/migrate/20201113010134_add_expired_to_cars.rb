class AddExpiredToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :expired, :boolean
  end
end
