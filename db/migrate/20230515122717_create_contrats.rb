class CreateContrats < ActiveRecord::Migration[7.0]
  def change
    create_table :contrats do |t|
      t.string :name_contrat
      t.references :information, null: false, foreign_key: true

      t.timestamps
    end
  end
end
