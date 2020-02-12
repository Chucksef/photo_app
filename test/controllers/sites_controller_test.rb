require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get sites_edit_url
    assert_response :success
  end

  test "should get update" do
    get sites_update_url
    assert_response :success
  end

end
