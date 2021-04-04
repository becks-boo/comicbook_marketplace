class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :comic_book
end
