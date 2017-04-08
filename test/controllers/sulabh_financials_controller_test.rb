require 'test_helper'

class SulabhFinancialsControllerTest < ActionController::TestCase
  setup do
    @sulabh_financial = sulabh_financials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_financials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_financial" do
    assert_difference('SulabhFinancial.count') do
      post :create, sulabh_financial: { approvedintrate: @sulabh_financial.approvedintrate, installmentcount: @sulabh_financial.installmentcount, installmentfrequency: @sulabh_financial.installmentfrequency, loanamount: @sulabh_financial.loanamount, policypremium: @sulabh_financial.policypremium, procfee: @sulabh_financial.procfee }
    end

    assert_redirected_to sulabh_financial_path(assigns(:sulabh_financial))
  end

  test "should show sulabh_financial" do
    get :show, id: @sulabh_financial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_financial
    assert_response :success
  end

  test "should update sulabh_financial" do
    patch :update, id: @sulabh_financial, sulabh_financial: { approvedintrate: @sulabh_financial.approvedintrate, installmentcount: @sulabh_financial.installmentcount, installmentfrequency: @sulabh_financial.installmentfrequency, loanamount: @sulabh_financial.loanamount, policypremium: @sulabh_financial.policypremium, procfee: @sulabh_financial.procfee }
    assert_redirected_to sulabh_financial_path(assigns(:sulabh_financial))
  end

  test "should destroy sulabh_financial" do
    assert_difference('SulabhFinancial.count', -1) do
      delete :destroy, id: @sulabh_financial
    end

    assert_redirected_to sulabh_financials_path
  end
end
