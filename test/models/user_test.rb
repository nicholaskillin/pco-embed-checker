require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new(name: "Test Person", email: "example@foo.bar",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "user should have a name" do
    user = User.new(email: "example@foo.bar")
    assert_not user.valid?
  end

  test "user should have an email address" do
    user = User.new(name: "Test User")
    assert_not user.valid?
  end

  test "valid users are saved" do
    assert_difference 'User.count', 1 do
      @user.save
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
