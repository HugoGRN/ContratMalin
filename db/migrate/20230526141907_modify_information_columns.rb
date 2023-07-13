class ModifyInformationColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :information, :address, :name_street
    add_column :information, :street_number, :integer
    add_column :information, :address_complement, :string
    add_column :information, :zip_code, :integer
    add_column :information, :city, :string
    add_column :information, :country, :string
    add_column :information, :usage_name, :string
    add_column :information, :nationality, :string
    add_column :information, :n_secu, :integer
    add_column :information, :rpps, :integer
  end
end
