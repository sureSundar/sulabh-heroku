require 'test_helper'

class SulabhSavingsControllerTest < ActionController::TestCase
  setup do
    @sulabh_saving = sulabh_savings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_savings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_saving" do
    assert_difference('SulabhSaving.count') do
      post :create, sulabh_saving: { aadhaar: @sulabh_saving.aadhaar, branch_name: @sulabh_saving.branch_name, creditAmount: @sulabh_saving.creditAmount, debitAmount: @sulabh_saving.debitAmount, depositDate: @sulabh_saving.depositDate, depositedinbank: @sulabh_saving.depositedinbank, remarks: @sulabh_saving.remarks, status: @sulabh_saving.status, sulabh_loan_confirm_id_id: @sulabh_saving.sulabh_loan_confirm_id_id, sulabh_user_profile_id_id: @sulabh_saving.sulabh_user_profile_id_id, transaction_date: @sulabh_saving.transaction_date }
    end

    assert_redirected_to sulabh_saving_path(assigns(:sulabh_saving))
  end

  test "should show sulabh_saving" do
    get :show, id: @sulabh_saving
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_saving
    assert_response :success
  end

  test "should update sulabh_saving" do
    patch :update, id: @sulabh_saving, sulabh_saving: { aadhaar: @sulabh_saving.aadhaar, branch_name: @sulabh_saving.branch_name, creditAmount: @sulabh_saving.creditAmount, debitAmount: @sulabh_saving.debitAmount, depositDate: @sulabh_saving.depositDate, depositedinbank: @sulabh_saving.depositedinbank, remarks: @sulabh_saving.remarks, status: @sulabh_saving.status, sulabh_loan_confirm_id_id: @sulabh_saving.sulabh_loan_confirm_id_id, sulabh_user_profile_id_id: @sulabh_saving.sulabh_user_profile_id_id, transaction_date: @sulabh_saving.transaction_date }
    assert_redirected_to sulabh_saving_path(assigns(:sulabh_saving))
  end

  test "should destroy sulabh_saving" do
    assert_difference('SulabhSaving.count', -1) do
      delete :destroy, id: @sulabh_saving
    end

    assert_redirected_to sulabh_savings_path
  end
end
