class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title, null: false
      t.text :detail
      t.monetize :price, null: false
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :offers, :users
  end
end
