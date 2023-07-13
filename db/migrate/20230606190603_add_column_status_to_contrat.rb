class AddColumnStatusToContrat < ActiveRecord::Migration[7.0]
  def change
    add_column :contrats, :status, :string
  end
end
