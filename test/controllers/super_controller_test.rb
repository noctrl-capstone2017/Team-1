# Test written by Robert Herrera
require 'test_helper'
##Doesn't work
class SuperControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get super_report page" do
  get super_report_url
  assert_response :success
  end
  
  test "should get super index page" do
  get super_index_url
  assert_response :success
  end

end
