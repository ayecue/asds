class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.float :total
      t.references :user, index: true

      t.timestamps
    end
  end
end
