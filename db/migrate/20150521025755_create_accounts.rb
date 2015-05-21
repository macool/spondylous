class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, index: true, null: false
      t.monetize :balance, null: false

      t.timestamps null: false
    end
    add_foreign_key :accounts, :users
  end
end
