class CreateMailings < ActiveRecord::Migration[6.0]
  def change
    create_table :mailings do |t|
      t.string :address_number, null: false
      t.integer :area_id, null: false
      t.string :sichoson, null: false
      t.string :banchi, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
