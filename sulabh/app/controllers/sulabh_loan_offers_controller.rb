class SulabhLoanOffersController < ApplicationController
  before_action :set_sulabh_loan_offer, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_loan_offers
  # GET /sulabh_loan_offers.json
  def index
    @sulabh_loan_offers = SulabhLoanOffer.all
  end

  # GET /sulabh_loan_offers/1
  # GET /sulabh_loan_offers/1.json
  def show
  end

  # GET /sulabh_loan_offers/new
  def new
    @sulabh_loan_offer = SulabhLoanOffer.new
  end

  # GET /sulabh_loan_offers/1/edit
  def edit
  end

  # POST /sulabh_loan_offers
  # POST /sulabh_loan_offers.json
  def create
    @sulabh_loan_offer = SulabhLoanOffer.new(sulabh_loan_offer_params)

    respond_to do |format|
      if @sulabh_loan_offer.save
        format.html { redirect_to @sulabh_loan_offer, notice: 'Sulabh loan offer was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_loan_offer }
      else
        format.html { render :new }
        format.json { render json: @sulabh_loan_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_loan_offers/1
  # PATCH/PUT /sulabh_loan_offers/1.json
  def update
    respond_to do |format|
      if @sulabh_loan_offer.update(sulabh_loan_offer_params)
        format.html { redirect_to @sulabh_loan_offer, notice: 'Sulabh loan offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_loan_offer }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_loan_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_loan_offers/1
  # DELETE /sulabh_loan_offers/1.json
  def destroy
    @sulabh_loan_offer.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_loan_offers_url, notice: 'Sulabh loan offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_loan_offer
      @sulabh_loan_offer = SulabhLoanOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_loan_offer_params
      params.require(:sulabh_loan_offer).permit(:username_id, :behavescore, :offeramount, :expiresby, :offerinterestrate, :paybydate, :interestrate)
    end
end
