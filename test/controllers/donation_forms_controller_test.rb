require 'test_helper'

class DonationFormsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @donation_form = @user.donation_forms.first
  end
  
  test "form index page should have side-nav" do
    log_in_as(@user)
    get donation_forms_path
    assert_template "donation_forms/index"
    assert_select "div#side-nav"
    assert_select "form"
  end

  test "forms show page should have side-nav" do
    log_in_as(@user)
    get donation_form_path(@donation_form)
    assert_template "donation_forms/show"
    assert_select "div#side-nav"
    assert_select "form"
  end
 
end