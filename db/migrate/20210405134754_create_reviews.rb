class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :rating
      t.bigint :author_id
      t.bigint :seller_id
      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :author_id, null: false
    add_foreign_key :reviews, :users, column: :seller_id, null: false
  end
end
