class AddColumnToContrat < ActiveRecord::Migration[7.0]
  def change
    add_column :contrats, :gender, :string
    add_column :contrats, :name, :string
    add_column :contrats, :first_name, :string
    add_column :contrats, :birthday, :date
    add_column :contrats, :place_birth, :string
    add_column :contrats, :registered_ordre, :string
    add_column :contrats, :n_ordinal, :integer
    add_column :contrats, :address, :string
    add_column :contrats, :email, :string
    add_column :contrats, :start_date, :date
    add_column :contrats, :end_date, :date
    add_column :contrats, :retro, :integer
    add_column :contrats, :payment_limit, :date
    add_column :contrats, :rayon_install, :integer
    add_column :contrats, :conflict_order, :string
    add_column :contrats, :made_on, :date
    add_column :contrats, :to, :string
  end
end
