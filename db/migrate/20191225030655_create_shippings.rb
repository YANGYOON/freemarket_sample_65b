class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :method, null: false
      t.string :prefecture_from, null: false
      t.string :period_before_shopping, null: false
      t.string :fee_burden, null: false
      t.references :item, foreign_key: true, null: false

      t.timestamps
    end
  end
end
