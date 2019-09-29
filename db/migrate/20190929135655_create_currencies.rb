class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.float :rate, null: false

      t.timestamps
    end
    add_index :currencies, :name, unique: true
  end
end
