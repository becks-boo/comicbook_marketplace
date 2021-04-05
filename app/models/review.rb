class Review < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
end
