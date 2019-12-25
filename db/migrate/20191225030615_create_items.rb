class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :state, null: false
      t.string :condition, null: false
      t.integer :price, null: false
      t.integer :buyer_id, null: false
      t.integer :seller_id
      t.integer :level, default: 0
      t.timestamps
    end
  end
end
