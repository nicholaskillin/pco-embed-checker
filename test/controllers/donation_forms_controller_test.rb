require 'test_helper'

class DonationFormsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  
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
=======
  test "should get show" do
    get donation_forms_show_url
    assert_response :success
  end

  test "should get index" do
    get donation_forms_index_url
    assert_response :success
  end

end
>>>>>>> 9023df14e9a068a31be48f4654fee530b0157894
