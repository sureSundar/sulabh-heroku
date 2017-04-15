class SulabhLoanRepayActualsController < ApplicationController
  before_action :set_sulabh_loan_repay_actual, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_loan_repay_actuals
  # GET /sulabh_loan_repay_actuals.json
  def index
    @sulabh_loan_repay_actuals = SulabhLoanRepayActual.all
  end

  # GET /sulabh_loan_repay_actuals/1
  # GET /sulabh_loan_repay_actuals/1.json
  def show
  end

  # GET /sulabh_loan_repay_actuals/new
  def new
    @sulabh_loan_repay_actual = SulabhLoanRepayActual.new
  end

  # GET /sulabh_loan_repay_actuals/1/edit
  def edit
  end

  # POST /sulabh_loan_repay_actuals
  # POST /sulabh_loan_repay_actuals.json
  def create
    @sulabh_loan_repay_actual = SulabhLoanRepayActual.new(sulabh_loan_repay_actual_params)

    respond_to do |format|
      if @sulabh_loan_repay_actual.save
        format.html { redirect_to @sulabh_loan_repay_actual, notice: 'Sulabh loan repay actual was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_loan_repay_actual }
      else
        format.html { render :new }
        format.json { render json: @sulabh_loan_repay_actual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_loan_repay_actuals/1
  # PATCH/PUT /sulabh_loan_repay_actuals/1.json
  def update
    respond_to do |format|
      if @sulabh_loan_repay_actual.update(sulabh_loan_repay_actual_params)
        format.html { redirect_to @sulabh_loan_repay_actual, notice: 'Sulabh loan repay actual was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_loan_repay_actual }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_loan_repay_actual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_loan_repay_actuals/1
  # DELETE /sulabh_loan_repay_actuals/1.json
  def destroy
    @sulabh_loan_repay_actual.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_loan_repay_actuals_url, notice: 'Sulabh loan repay actual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_loan_repay_actual
      @sulabh_loan_repay_actual = SulabhLoanRepayActual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_loan_repay_actual_params
      params.require(:sulabh_loan_repay_actual).permit(:sulabh_loan_confim_id_id, :installment_no, :installment_amount, :datepaid, :actinterest, :actdueafterinst)
    end
end
