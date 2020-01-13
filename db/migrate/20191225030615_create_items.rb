class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :state, null: false
      t.string :condition, null: false
      t.integer :price, null: false
      t.integer :level, default: 0
      t.integer :likes_count, default: 0
      t.integer :buyer_id
      t.integer :seller_id
      t.timestamps
    end
  end
end
