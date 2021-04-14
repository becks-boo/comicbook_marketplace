class ComicBook < ApplicationRecord
  belongs_to :user

  has_many :purchases
  has_many_attached :pictures, dependent: :destroy

  validates :name, :location, :quantity, :price, :description, presence: true, allow_blank: false
  validates :description, length: { minimum: 5, too_short: "Please type at least a 5 character long description", maximum: 500, too_long: "500 characters is the maximum allowed" }
end
