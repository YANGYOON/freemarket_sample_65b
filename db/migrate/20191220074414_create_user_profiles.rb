class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.text :self_introduction,       optional: true
      t.string :last_name,             null: false
      t.string :first_name,            null: false
      t.string :last_name_kana,        null: false
      t.string :first_name_kana,       null: false
      t.string :birth_year,            null: false
      t.string :brith_month,           null: false
      t.string :birth_day,             null: false
      t.string :phone_number,          null: false
      t.string :optional_phone_number, optional: true
      t.integer :user_id,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
