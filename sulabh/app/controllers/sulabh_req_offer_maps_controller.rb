class SulabhReqOfferMapsController < ApplicationController
  before_action :set_sulabh_req_offer_map, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_req_offer_maps
  # GET /sulabh_req_offer_maps.json
  def index
    @sulabh_req_offer_maps = SulabhReqOfferMap.all
  end

  # GET /sulabh_req_offer_maps/1
  # GET /sulabh_req_offer_maps/1.json
  def show
  end

  # GET /sulabh_req_offer_maps/new
  def new
    @sulabh_req_offer_map = SulabhReqOfferMap.new
  end

  # GET /sulabh_req_offer_maps/1/edit
  def edit
  end

  # POST /sulabh_req_offer_maps
  # POST /sulabh_req_offer_maps.json
  def create
    @sulabh_req_offer_map = SulabhReqOfferMap.new(sulabh_req_offer_map_params)

    respond_to do |format|
      if @sulabh_req_offer_map.save
        format.html { redirect_to @sulabh_req_offer_map, notice: 'Sulabh req offer map was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_req_offer_map }
      else
        format.html { render :new }
        format.json { render json: @sulabh_req_offer_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_req_offer_maps/1
  # PATCH/PUT /sulabh_req_offer_maps/1.json
  def update
    respond_to do |format|
      if @sulabh_req_offer_map.update(sulabh_req_offer_map_params)
        format.html { redirect_to @sulabh_req_offer_map, notice: 'Sulabh req offer map was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_req_offer_map }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_req_offer_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_req_offer_maps/1
  # DELETE /sulabh_req_offer_maps/1.json
  def destroy
    @sulabh_req_offer_map.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_req_offer_maps_url, notice: 'Sulabh req offer map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_req_offer_map
      @sulabh_req_offer_map = SulabhReqOfferMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_req_offer_map_params
      params.require(:sulabh_req_offer_map).permit(:request_id, :offer_id, :status)
    end
end
