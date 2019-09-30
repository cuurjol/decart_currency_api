class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :access_token, null: false

      t.timestamps
    end
  end
end
