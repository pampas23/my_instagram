class CreatePics < ActiveRecord::Migration[5.0]
  def change
    create_table :pics do |t|
      t.string :tittle
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
