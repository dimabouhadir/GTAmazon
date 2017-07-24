class AddUnitPriceToOrderProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :order_products, :unit_price, :decimal
  end
end
