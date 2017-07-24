class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.integer :order_num

      t.belongs_to :client

      t.timestamps

    end
  end
end
