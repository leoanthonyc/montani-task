require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "can save if title, isbn_13, list_price, publication_year, and publisher are present" do
    publisher = publishers(:one)
    assert Book.new(
      publisher: publisher,
      title: "Antifragile",
      isbn_13: "9780812979688",
      list_price: 10,
      publication_year: Time.current.beginning_of_year
    ).save!
  end

  test "can't save if required fields are missing" do
    publisher = publishers(:one)
    assert_not Book.new(
      publisher: publisher,
      isbn_13: "9780812979688",
      list_price: 10,
      publication_year: Time.current.beginning_of_year
    ).save

    assert_not Book.new(
      publisher: publisher,
      title: "Antifragile",
      list_price: 10,
      publication_year: Time.current.beginning_of_year
    ).save

    assert_not Book.new(
      publisher: publisher,
      title: "Antifragile",
      isbn_13: "9780812979688",
      publication_year: Time.current.beginning_of_year
    ).save

    assert_not Book.new(
      publisher: publisher,
      title: "Antifragile",
      isbn_13: "9780812979688",
      list_price: 10
    ).save
  end
end
