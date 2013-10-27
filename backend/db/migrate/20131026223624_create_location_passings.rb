class CreateLocationPassings < ActiveRecord::Migration
  def change
    create_table :location_passings do |t|
      t.point :enter_point
      t.datetime :entered_at
      t.point :exit_point
      t.datetime :exited_at
      t.references :user
      t.references :location

      t.timestamps
    end
  end
end
