class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :status, presence: true, inclusion: { in: %w[reading completed, wishlist] }
end
