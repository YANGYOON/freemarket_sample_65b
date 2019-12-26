class CreatePhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
      t.string :phone_number,   null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
    add_index :phone_numbers, :phone_number,                unique: true
  end
end
