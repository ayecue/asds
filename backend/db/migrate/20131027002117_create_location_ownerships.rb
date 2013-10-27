class CreateLocationOwnerships < ActiveRecord::Migration
  def change
    create_table :location_ownerships do |t|
      t.references :location, index: true
      t.references :user, index: true
      t.references :transaktion
      t.datetime :start
      t.datetime :end
      t.integer :prolonged


      t.timestamps
    end
  end
end
