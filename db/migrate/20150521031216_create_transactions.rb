class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :account, index: true, null: false
      t.references :offer, index: true, null: false
      t.monetize :cached_price, null: false

      t.timestamps null: false
    end
    add_foreign_key :transactions, :accounts
    add_foreign_key :transactions, :offers
  end
end
