class Book < ApplicationRecord
  belongs_to :publisher

  validates :title, presence: true
  validates :isbn_13, presence: true
  validates :list_price, presence: true
  validates :publication_year, presence: true
end
