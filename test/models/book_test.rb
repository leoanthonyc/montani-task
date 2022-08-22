require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "can save if title, isbn_13, list_price, publication_year, author, and publisher are present" do
    publisher = publishers(:one)
    assert Book.new(
      author: authors(:one),
      publisher: publisher,
      title: "Antifragile",
      isbn_13: "9780812979688",
      list_price: 10,
      publication_year: Time.current.beginning_of_year
    ).save
  end

  test "can't save if required fields are missing" do
    publisher = publishers(:one)
    author = authors(:one)

    # missing publisher
    assert_not Book.new(
      author: author,
      isbn_13: "9780812979688",
      list_price: 10,
      publication_year: Time.current.beginning_of_year
    ).save

    # missing author
    assert_not Book.new(
      publisher: publisher,
      isbn_13: "9780812979688",
      list_price: 10,
      publication_year: Time.current.beginning_of_year
    ).save

    # missing title
    assert_not Book.new(
      publisher: publisher,
      author: author,
      isbn_13: "9780812979688",
      list_price: 10,
      publication_year: Time.current.beginning_of_year
    ).save

    # missing isbn_13
    assert_not Book.new(
      publisher: publisher,
      author: author,
      title: "Antifragile",
      list_price: 10,
      publication_year: Time.current.beginning_of_year
    ).save

    # missing list_price
    assert_not Book.new(
      publisher: publisher,
      author: author,
      title: "Antifragile",
      isbn_13: "9780812979688",
      publication_year: Time.current.beginning_of_year
    ).save

    # missing publication_year
    assert_not Book.new(
      publisher: publisher,
      author: author,
      title: "Antifragile",
      isbn_13: "9780812979688",
      list_price: 10
    ).save
  end
end
