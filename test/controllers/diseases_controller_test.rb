require 'test_helper'

class DiseasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diseases_index_url
    assert_response :success
  end

end
