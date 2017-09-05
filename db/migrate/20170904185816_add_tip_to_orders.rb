class AddTipToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :tip, :decimal
  end
end
