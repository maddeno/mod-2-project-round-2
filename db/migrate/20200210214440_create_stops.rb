class CreateStops < ActiveRecord::Migration[6.0]
  def change
    create_table :stops do |t|
      t.integer :route_id
      t.string :city_name
      t.text :attractions

      t.timestamps
    end
  end
end
