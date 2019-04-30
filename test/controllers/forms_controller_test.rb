require 'test_helper'

class FormsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @form = @user.forms.first
  end
  
  test "form index page should have side-nav" do
    log_in_as(@user)
    get forms_path
    assert_template "forms/index"
    assert_select "div#side-nav"
    assert_select "form"
  end

  test "forms show page should have side-nav" do
    log_in_as(@user)
    get form_path(@form)
    assert_template "forms/show"
    assert_select "div#side-nav"
    assert_select "form"
  end
 
end
