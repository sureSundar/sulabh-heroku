class SulabhOfferStatusesController < ApplicationController
  before_action :set_sulabh_offer_status, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_offer_statuses
  # GET /sulabh_offer_statuses.json
  def index
    @sulabh_offer_statuses = SulabhOfferStatus.all
  end

  # GET /sulabh_offer_statuses/1
  # GET /sulabh_offer_statuses/1.json
  def show
  end

  # GET /sulabh_offer_statuses/new
  def new
    @sulabh_offer_status = SulabhOfferStatus.new
  end

  # GET /sulabh_offer_statuses/1/edit
  def edit
  end

  # POST /sulabh_offer_statuses
  # POST /sulabh_offer_statuses.json
  def create
    @sulabh_offer_status = SulabhOfferStatus.new(sulabh_offer_status_params)

    respond_to do |format|
      if @sulabh_offer_status.save
        format.html { redirect_to @sulabh_offer_status, notice: 'Sulabh offer status was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_offer_status }
      else
        format.html { render :new }
        format.json { render json: @sulabh_offer_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_offer_statuses/1
  # PATCH/PUT /sulabh_offer_statuses/1.json
  def update
    respond_to do |format|
      if @sulabh_offer_status.update(sulabh_offer_status_params)
        format.html { redirect_to @sulabh_offer_status, notice: 'Sulabh offer status was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_offer_status }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_offer_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_offer_statuses/1
  # DELETE /sulabh_offer_statuses/1.json
  def destroy
    @sulabh_offer_status.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_offer_statuses_url, notice: 'Sulabh offer status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_offer_status
      @sulabh_offer_status = SulabhOfferStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_offer_status_params
      params.require(:sulabh_offer_status).permit(:offer_id, :status)
    end
end
