class SulabhLoanRepaySchedulesController < ApplicationController
  before_action :set_sulabh_loan_repay_schedule, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_loan_repay_schedules
  # GET /sulabh_loan_repay_schedules.json
  def index
    @sulabh_loan_repay_schedules = SulabhLoanRepaySchedule.all
  end

  # GET /sulabh_loan_repay_schedules/1
  # GET /sulabh_loan_repay_schedules/1.json
  def show
  end

  # GET /sulabh_loan_repay_schedules/new
  def new
    @sulabh_loan_repay_schedule = SulabhLoanRepaySchedule.new
  end

  # GET /sulabh_loan_repay_schedules/1/edit
  def edit
  end

  # POST /sulabh_loan_repay_schedules
  # POST /sulabh_loan_repay_schedules.json
  def create
    @sulabh_loan_repay_schedule = SulabhLoanRepaySchedule.new(sulabh_loan_repay_schedule_params)

    respond_to do |format|
      if @sulabh_loan_repay_schedule.save
        format.html { redirect_to @sulabh_loan_repay_schedule, notice: 'Sulabh loan repay schedule was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_loan_repay_schedule }
      else
        format.html { render :new }
        format.json { render json: @sulabh_loan_repay_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_loan_repay_schedules/1
  # PATCH/PUT /sulabh_loan_repay_schedules/1.json
  def update
    respond_to do |format|
      if @sulabh_loan_repay_schedule.update(sulabh_loan_repay_schedule_params)
        format.html { redirect_to @sulabh_loan_repay_schedule, notice: 'Sulabh loan repay schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_loan_repay_schedule }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_loan_repay_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_loan_repay_schedules/1
  # DELETE /sulabh_loan_repay_schedules/1.json
  def destroy
    @sulabh_loan_repay_schedule.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_loan_repay_schedules_url, notice: 'Sulabh loan repay schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_loan_repay_schedule
      @sulabh_loan_repay_schedule = SulabhLoanRepaySchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_loan_repay_schedule_params
      params.require(:sulabh_loan_repay_schedule).permit(:sulabh_loan_confim_id_id, :principal, :installment_no, :installment_due_date, :installment_amount, :interest_for_installment, :due_after_installment)
    end
end
