require 'test_helper'

class SulabhSavingsBalancesControllerTest < ActionController::TestCase
  setup do
    @sulabh_savings_balance = sulabh_savings_balances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_savings_balances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_savings_balance" do
    assert_difference('SulabhSavingsBalance.count') do
      post :create, sulabh_savings_balance: { aadhar: @sulabh_savings_balance.aadhar, currentBal: @sulabh_savings_balance.currentBal }
    end

    assert_redirected_to sulabh_savings_balance_path(assigns(:sulabh_savings_balance))
  end

  test "should show sulabh_savings_balance" do
    get :show, id: @sulabh_savings_balance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_savings_balance
    assert_response :success
  end

  test "should update sulabh_savings_balance" do
    patch :update, id: @sulabh_savings_balance, sulabh_savings_balance: { aadhar: @sulabh_savings_balance.aadhar, currentBal: @sulabh_savings_balance.currentBal }
    assert_redirected_to sulabh_savings_balance_path(assigns(:sulabh_savings_balance))
  end

  test "should destroy sulabh_savings_balance" do
    assert_difference('SulabhSavingsBalance.count', -1) do
      delete :destroy, id: @sulabh_savings_balance
    end

    assert_redirected_to sulabh_savings_balances_path
  end
end
