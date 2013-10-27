class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.point :latlong
      t.float :price

      t.timestamps
    end
  end
end