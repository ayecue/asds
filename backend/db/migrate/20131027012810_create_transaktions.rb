class CreateTransaktions < ActiveRecord::Migration
  def change
    create_table :transaktions do |t|
      t.references :transaktionable, polymorphic: true
      t.references :wallet, index: true
      t.float :amount
      t.string :action

      t.timestamps
    end
  end
end
