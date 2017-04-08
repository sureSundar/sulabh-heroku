class SulabhFinancialsController < ApplicationController
  before_action :set_sulabh_financial, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_financials
  # GET /sulabh_financials.json
  def index
    @sulabh_financials = SulabhFinancial.all
  end

  # GET /sulabh_financials/1
  # GET /sulabh_financials/1.json
  def show
  end

  # GET /sulabh_financials/new
  def new
    @sulabh_financial = SulabhFinancial.new
  end

  # GET /sulabh_financials/1/edit
  def edit
  end

  # POST /sulabh_financials
  # POST /sulabh_financials.json
  def create
    @sulabh_financial = SulabhFinancial.new(sulabh_financial_params)

    respond_to do |format|
      if @sulabh_financial.save
        format.html { redirect_to @sulabh_financial, notice: 'Sulabh financial was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_financial }
      else
        format.html { render :new }
        format.json { render json: @sulabh_financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_financials/1
  # PATCH/PUT /sulabh_financials/1.json
  def update
    respond_to do |format|
      if @sulabh_financial.update(sulabh_financial_params)
        format.html { redirect_to @sulabh_financial, notice: 'Sulabh financial was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_financial }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_financials/1
  # DELETE /sulabh_financials/1.json
  def destroy
    @sulabh_financial.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_financials_url, notice: 'Sulabh financial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_financial
      @sulabh_financial = SulabhFinancial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_financial_params
      params.require(:sulabh_financial).permit(:loanamount, :policypremium, :procfee, :approvedintrate, :installmentcount, :installmentfrequency)
    end
end
