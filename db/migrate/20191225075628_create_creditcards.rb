class CreateCreditcards < ActiveRecord::Migration[5.2]
  def change
    create_table :creditcards do |t|
      t.text :security_token, null: false
      t.references :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end