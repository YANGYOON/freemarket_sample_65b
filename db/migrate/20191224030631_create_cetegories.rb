class CreateCetegories < ActiveRecord::Migration[5.2]
  def change
    create_table :cetegories do |t|
      t.string :name, null: false
      t.string :ancestry
      t.timestamps
    end
  end
end
