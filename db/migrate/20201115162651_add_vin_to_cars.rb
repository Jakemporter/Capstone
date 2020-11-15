class AddVinToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :VIN, :string
  end
end
