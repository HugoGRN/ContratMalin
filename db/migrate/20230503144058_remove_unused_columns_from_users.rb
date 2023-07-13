class RemoveUnusedColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name
    remove_column :users, :first_name
    remove_column :users, :birthday
    remove_column :users, :place_birth
    remove_column :users, :gender
    remove_column :users, :diploma
    remove_column :users, :graduation_date
    remove_column :users, :place_diploma
    remove_column :users, :n_ordinal
    remove_column :users, :registered_ordre
    remove_column :users, :address_pro
  end
end
