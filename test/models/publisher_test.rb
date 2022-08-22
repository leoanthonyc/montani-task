require "test_helper"

class PublisherTest < ActiveSupport::TestCase
  test "can save when name is present" do
    assert Publisher.new(name: "Big Bad Wolf").save
  end

  test "can't save when name is not present" do
    assert_not Publisher.new.save
  end
end
