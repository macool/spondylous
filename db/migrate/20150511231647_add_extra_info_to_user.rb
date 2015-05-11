class AddExtraInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :dni, :string, null: false

    add_index :users, :dni, unique: true
  end
end
