class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :location
      t.string :univers
      t.integer :price
      t.text :skills
      t.string :photo_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
