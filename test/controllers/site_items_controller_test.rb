require 'test_helper'

class SiteItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_items_index_url
    assert_response :success
  end

end
