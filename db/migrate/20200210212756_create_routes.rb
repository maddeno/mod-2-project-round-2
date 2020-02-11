class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.integer :total_distance
      t.string :directions

      t.timestamps
    end
  end
end
