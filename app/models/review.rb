class Review < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id

  validates :description, presence: true
  validates :description, length: { minimum: 5, too_short: "Please type at least a 5 character long description", maximum: 500, too_long: "500 characters is the maximum allowed" }
end
