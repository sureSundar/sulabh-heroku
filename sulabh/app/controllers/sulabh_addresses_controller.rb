class SulabhAddressesController < ApplicationController
  before_action :set_sulabh_address, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_addresses
  # GET /sulabh_addresses.json
  def index
    @sulabh_addresses = SulabhAddress.all
	respond_to do |format|
		format.js
		format.html
	end  
  end

  # GET /sulabh_addresses/1
  # GET /sulabh_addresses/1.json
  def show
	@sa = SulabhAddress.find params[:id].to_i

	respond_to do |format|
		format.js
		format.html
	end  
  end

  # GET /sulabh_addresses/new
  def new
    @sulabh_address = SulabhAddress.new
  end

  # GET /sulabh_addresses/1/edit
  def edit
  end

  # POST /sulabh_addresses
  # POST /sulabh_addresses.json
  def create
    @sulabh_address = SulabhAddress.new(sulabh_address_params)

    respond_to do |format|
      if @sulabh_address.save
        format.html { redirect_to @sulabh_address, notice: 'Sulabh address was successfully created.' }
		format.js
        format.json { render :show, status: :created, location: @sulabh_address }
      else
        format.html { render :new }
        format.json { render json: @sulabh_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_addresses/1
  # PATCH/PUT /sulabh_addresses/1.json
  def update
    respond_to do |format|
      if @sulabh_address.update(sulabh_address_params)
        format.html { redirect_to @sulabh_address, notice: 'Sulabh address was successfully updated.' }
		format.js
        format.json { render :show, status: :ok, location: @sulabh_address }
      else
        format.html { render :edit }
		format.js
        format.json { render json: @sulabh_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_addresses/1
  # DELETE /sulabh_addresses/1.json
  def destroy
    @sulabh_address.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_addresses_url, notice: 'Sulabh address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_address
      @sulabh_address = SulabhAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_address_params
      params.require(:sulabh_address).permit(:address1, :address2, :address3, :city, :pincode, :country)
    end
end
