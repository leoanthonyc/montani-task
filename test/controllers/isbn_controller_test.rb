require "test_helper"

class IsbnControllerTest < ActionDispatch::IntegrationTest
  test "valid isbn 13" do
    get '/isbn/9781509843527/toggle'
    assert_response :ok
  end

  test "valid isbn 10" do
    get '/isbn/1509843523/toggle'
    assert_response :ok
  end

  test "invalid isbn" do
    get '/isbn/1509843523234234234/toggle'
    assert_response :bad_request
  end
end
