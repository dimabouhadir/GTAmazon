class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :model_num
      t.decimal :price

      t.belongs_to :manufacturer, foreign_key: true


      t.timestamps

    end
  end
end
