class CreateComicBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :comic_books do |t|
      t.string :series
      t.string :name
      t.string :issue
      t.datetime :release_date
      t.string :writer
      t.string :artist
      t.string :location
      t.integer :quantity
      t.integer :price
      t.string :condition
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
