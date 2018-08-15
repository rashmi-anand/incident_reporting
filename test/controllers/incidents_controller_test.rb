require 'test_helper'

class IncidentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get incidents_new_url
    assert_response :success
  end

  test "should get create" do
    get incidents_create_url
    assert_response :success
  end

  test "should get index" do
    get incidents_index_url
    assert_response :success
  end

  test "should get quick_report" do
    get incidents_quick_report_url
    assert_response :success
  end

end
