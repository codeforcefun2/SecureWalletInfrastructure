class CreateWallets < ActiveRecord::Migration[6.1]
    def change
      create_table :wallets do |t|
        t.string :address, null: false, unique: true
        t.timestamps
      end
      add_index :wallets, :address, unique: true
    end
  end
  