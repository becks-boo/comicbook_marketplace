class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :status
      t.string :value
      t.references :user, null: false, foreign_key: true
      t.references :comic_book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
