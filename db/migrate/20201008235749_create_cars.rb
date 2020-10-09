class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.string :year
      t.text :description
      t.integer :miles
      t.integer :user_id

      t.timestamps
    end
  end
end
