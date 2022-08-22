class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    [first_name, last_name].join(" ")
  end
end
