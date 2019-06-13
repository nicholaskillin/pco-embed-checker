require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new(name: "Test Person")
  end
  
  test "user should have a name" do
    user = User.new()
    assert_not user.valid?
  end

  test "valid users are saved" do
    assert_difference 'User.count', 1 do
      @user.save
    end
  end

end
