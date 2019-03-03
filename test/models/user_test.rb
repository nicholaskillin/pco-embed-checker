require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "user should have a name" do
    user = User.new(email: "example@foo.bar")
    assert_not user.valid?
  end

  test "user should have an email address" do
    user = User.new(name: "Test User")
    assert_not user.valid?
  end

end
