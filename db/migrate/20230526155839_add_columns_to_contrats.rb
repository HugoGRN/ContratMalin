class AddColumnsToContrats < ActiveRecord::Migration[7.0]
  def change
    add_column :contrats, :n_urssaf, :integer
    add_column :contrats, :nb_refus, :integer
    add_column :contrats, :blackout_period, :integer
  end
end
