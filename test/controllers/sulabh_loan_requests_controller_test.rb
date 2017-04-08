require 'test_helper'

class SulabhLoanRequestsControllerTest < ActionController::TestCase
  setup do
    @sulabh_loan_request = sulabh_loan_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_loan_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_loan_request" do
    assert_difference('SulabhLoanRequest.count') do
      post :create, sulabh_loan_request: { amount: @sulabh_loan_request.amount, behavescore: @sulabh_loan_request.behavescore, interest: @sulabh_loan_request.interest, maxinterest: @sulabh_loan_request.maxinterest, maxpaybyamount: @sulabh_loan_request.maxpaybyamount, mininterest: @sulabh_loan_request.mininterest, minpaybyamount: @sulabh_loan_request.minpaybyamount, paybydate: @sulabh_loan_request.paybydate, requiredby: @sulabh_loan_request.requiredby, username_id: @sulabh_loan_request.username_id }
    end

    assert_redirected_to sulabh_loan_request_path(assigns(:sulabh_loan_request))
  end

  test "should show sulabh_loan_request" do
    get :show, id: @sulabh_loan_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_loan_request
    assert_response :success
  end

  test "should update sulabh_loan_request" do
    patch :update, id: @sulabh_loan_request, sulabh_loan_request: { amount: @sulabh_loan_request.amount, behavescore: @sulabh_loan_request.behavescore, interest: @sulabh_loan_request.interest, maxinterest: @sulabh_loan_request.maxinterest, maxpaybyamount: @sulabh_loan_request.maxpaybyamount, mininterest: @sulabh_loan_request.mininterest, minpaybyamount: @sulabh_loan_request.minpaybyamount, paybydate: @sulabh_loan_request.paybydate, requiredby: @sulabh_loan_request.requiredby, username_id: @sulabh_loan_request.username_id }
    assert_redirected_to sulabh_loan_request_path(assigns(:sulabh_loan_request))
  end

  test "should destroy sulabh_loan_request" do
    assert_difference('SulabhLoanRequest.count', -1) do
      delete :destroy, id: @sulabh_loan_request
    end

    assert_redirected_to sulabh_loan_requests_path
  end
end
