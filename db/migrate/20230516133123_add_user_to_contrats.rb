class AddUserToContrats < ActiveRecord::Migration[7.0]
  def change
    add_reference :contrats, :user, null: false, foreign_key: true
  end
end
