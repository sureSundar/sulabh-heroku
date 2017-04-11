require 'test_helper'

class FluidicControllerTest < ActionController::TestCase
  test "should get requestflow" do
    get :requestflow
    assert_response :success
  end

end
