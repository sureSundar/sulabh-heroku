class SulabhLoanConfirmsController < ApplicationController
  before_action :set_sulabh_loan_confirm, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_loan_confirms
  # GET /sulabh_loan_confirms.json
  def index
    @sulabh_loan_confirms = SulabhLoanConfirm.all
  end

  # GET /sulabh_loan_confirms/1
  # GET /sulabh_loan_confirms/1.json
  def show
  end

  # GET /sulabh_loan_confirms/new
  def new
    @sulabh_loan_confirm = SulabhLoanConfirm.new
  end

  # GET /sulabh_loan_confirms/1/edit
  def edit
  end

  # POST /sulabh_loan_confirms
  # POST /sulabh_loan_confirms.json
  def create
    @sulabh_loan_confirm = SulabhLoanConfirm.new(sulabh_loan_confirm_params)

    respond_to do |format|
      if @sulabh_loan_confirm.save
        format.html { redirect_to @sulabh_loan_confirm, notice: 'Sulabh loan confirm was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_loan_confirm }
      else
        format.html { render :new }
        format.json { render json: @sulabh_loan_confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_loan_confirms/1
  # PATCH/PUT /sulabh_loan_confirms/1.json
  def update
    respond_to do |format|
      if @sulabh_loan_confirm.update(sulabh_loan_confirm_params)
        format.html { redirect_to @sulabh_loan_confirm, notice: 'Sulabh loan confirm was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_loan_confirm }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_loan_confirm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_loan_confirms/1
  # DELETE /sulabh_loan_confirms/1.json
  def destroy
    @sulabh_loan_confirm.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_loan_confirms_url, notice: 'Sulabh loan confirm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_loan_confirm
      @sulabh_loan_confirm = SulabhLoanConfirm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_loan_confirm_params
      params.require(:sulabh_loan_confirm).permit(:request_id, :offer_id, :policyno_id, :financedetails_id)
    end
end
