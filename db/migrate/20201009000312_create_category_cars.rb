class CreateCategoryCars < ActiveRecord::Migration[6.0]
  def change
    create_table :category_cars do |t|
      t.integer :category_id
      t.integer :car_id

      t.timestamps
    end
  end
end
