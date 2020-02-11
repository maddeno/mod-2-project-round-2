class CreateTiers < ActiveRecord::Migration[6.0]
  def change
    create_table :tiers do |t|
      t.string :name
      t.string :amenities 
      t.integer :price

      t.timestamps
    end
  end
end
