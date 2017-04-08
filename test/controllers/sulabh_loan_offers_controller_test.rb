require 'test_helper'

class SulabhLoanOffersControllerTest < ActionController::TestCase
  setup do
    @sulabh_loan_offer = sulabh_loan_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sulabh_loan_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sulabh_loan_offer" do
    assert_difference('SulabhLoanOffer.count') do
      post :create, sulabh_loan_offer: { behavescore: @sulabh_loan_offer.behavescore, expiresby: @sulabh_loan_offer.expiresby, interestrate: @sulabh_loan_offer.interestrate, offeramount: @sulabh_loan_offer.offeramount, offerinterestrate: @sulabh_loan_offer.offerinterestrate, paybydate: @sulabh_loan_offer.paybydate, username_id: @sulabh_loan_offer.username_id }
    end

    assert_redirected_to sulabh_loan_offer_path(assigns(:sulabh_loan_offer))
  end

  test "should show sulabh_loan_offer" do
    get :show, id: @sulabh_loan_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sulabh_loan_offer
    assert_response :success
  end

  test "should update sulabh_loan_offer" do
    patch :update, id: @sulabh_loan_offer, sulabh_loan_offer: { behavescore: @sulabh_loan_offer.behavescore, expiresby: @sulabh_loan_offer.expiresby, interestrate: @sulabh_loan_offer.interestrate, offeramount: @sulabh_loan_offer.offeramount, offerinterestrate: @sulabh_loan_offer.offerinterestrate, paybydate: @sulabh_loan_offer.paybydate, username_id: @sulabh_loan_offer.username_id }
    assert_redirected_to sulabh_loan_offer_path(assigns(:sulabh_loan_offer))
  end

  test "should destroy sulabh_loan_offer" do
    assert_difference('SulabhLoanOffer.count', -1) do
      delete :destroy, id: @sulabh_loan_offer
    end

    assert_redirected_to sulabh_loan_offers_path
  end
end
