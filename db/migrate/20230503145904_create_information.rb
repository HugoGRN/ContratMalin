class CreateInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :information do |t|
      t.string :name
      t.string :first_name
      t.date :birthday
      t.string :place_birth
      t.string :gender
      t.string :diploma
      t.date :graduation_date
      t.string :place_diploma
      t.integer :n_ordinal
      t.string :registered_ordre
      t.string :address
      t.string :address_pro

      t.timestamps
    end
  end
end
