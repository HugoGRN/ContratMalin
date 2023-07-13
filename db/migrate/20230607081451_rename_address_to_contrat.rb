class RenameAddressToContrat < ActiveRecord::Migration[7.0]
  def change
    rename_column :contrats, :address, :address_pro
  end
end
