require 'test_helper'

class WidgetsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @widget = @user.widgets.first
  end
  
  test "widget index page should have side-nav" do
    log_in_as(@user)
    get widgets_path
    assert_template "widgets/index"
    assert_select "div#side-nav"
    assert_select "form"
  end

  test "widget show page should have side-nav" do
    log_in_as(@user)
    get widget_path(@widget)
    assert_template "widgets/show"
    assert_select "div#side-nav"
    assert_select "form"
  end

end
