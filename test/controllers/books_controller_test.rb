require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "it returns not_found status if isbn_13 does not match a book" do
    get '/books/9781566199094'
    assert_response :not_found
  end

  test "it returns invalid_request status if isbn_13 is invalid" do
    get '/books/123'
    assert_response :bad_request
  end
end
