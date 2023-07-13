class ChangePaymentLimitToContrat < ActiveRecord::Migration[7.0]
  def change
    change_column :contrats, :payment_limit, :integer
  end
end
