class Book < ApplicationRecord
  belongs_to :publisher

  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :title, presence: true
  validates :isbn_13, presence: true
  validates :list_price, presence: true
  validates :publication_year, presence: true

  def authors=(author_or_authors)
    super(Array.wrap(author_or_authors))
  end
  alias_attribute :author=, :authors=
  alias_attribute :author, :authors
end
