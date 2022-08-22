require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test "can save when first_name and last_name are present" do
    assert Author.new(first_name: "John", last_name: "Appleseed").save
  end

  test "can't save when only first_name is present" do
    assert_not Author.new(first_name: "John").save
  end

  test "can't save when only last_name is present" do
    assert_not Author.new(first_name: "John").save
  end
end
