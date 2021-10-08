require 'test_helper'

class MetricsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get metrics_index_url
    assert_response :success
  end

  test "should create metric" do 
    post metrics_create_url 
    assert_response :success
  end

  test "should get show" do
    get metrics_show_url
    assert_response :success
  end

end
