class SulabhRequestStatusesController < ApplicationController
  before_action :set_sulabh_request_status, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_request_statuses
  # GET /sulabh_request_statuses.json
  def index
    @sulabh_request_statuses = SulabhRequestStatus.all
  end

  # GET /sulabh_request_statuses/1
  # GET /sulabh_request_statuses/1.json
  def show
  end

  # GET /sulabh_request_statuses/new
  def new
    @sulabh_request_status = SulabhRequestStatus.new
  end

  # GET /sulabh_request_statuses/1/edit
  def edit
  end

  # POST /sulabh_request_statuses
  # POST /sulabh_request_statuses.json
  def create
    @sulabh_request_status = SulabhRequestStatus.new(sulabh_request_status_params)

    respond_to do |format|
      if @sulabh_request_status.save
        format.html { redirect_to @sulabh_request_status, notice: 'Sulabh request status was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_request_status }
      else
        format.html { render :new }
        format.json { render json: @sulabh_request_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_request_statuses/1
  # PATCH/PUT /sulabh_request_statuses/1.json
  def update
    respond_to do |format|
      if @sulabh_request_status.update(sulabh_request_status_params)
        format.html { redirect_to @sulabh_request_status, notice: 'Sulabh request status was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_request_status }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_request_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_request_statuses/1
  # DELETE /sulabh_request_statuses/1.json
  def destroy
    @sulabh_request_status.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_request_statuses_url, notice: 'Sulabh request status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_request_status
      @sulabh_request_status = SulabhRequestStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_request_status_params
      params.require(:sulabh_request_status).permit(:request_id, :status)
    end
end
