require 'test_helper'

class DonationFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get donation_forms_show_url
    assert_response :success
  end

  test "should get index" do
    get donation_forms_index_url
    assert_response :success
  end

end
