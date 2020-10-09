class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.integer :car_id
      t.integer :user_id
      t.integer :bid

      t.timestamps
    end
  end
end
