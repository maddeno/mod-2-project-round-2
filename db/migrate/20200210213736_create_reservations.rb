class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :passenger_id
      t.integer :route_id
      t.integer :tier_id
      t.string :destination_city 
      t.string :departure_city 
      t.string :departure_date

      t.timestamps
    end
  end
end
