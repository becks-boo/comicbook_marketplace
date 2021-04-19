class Purchase < ApplicationRecord
  enum status: %w(accepted pending declined)
  after_initialize :set_default

  belongs_to :user
  belongs_to :comic_book

  validates :status, :value, presence: true

  def set_default
    self.status = "pending"
  end
end
