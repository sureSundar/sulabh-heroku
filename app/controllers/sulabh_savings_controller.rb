class SulabhSavingsController < ApplicationController
  before_action :set_sulabh_saving, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_savings
  # GET /sulabh_savings.json
  def index
    @sulabh_savings = SulabhSaving.all
  end

  # GET /sulabh_savings/1
  # GET /sulabh_savings/1.json
  def show
  end

  # GET /sulabh_savings/new
  def new
    @sulabh_saving = SulabhSaving.new
  end

  # GET /sulabh_savings/1/edit
  def edit
  end

  # POST /sulabh_savings
  # POST /sulabh_savings.json
  def create
    @sulabh_saving = SulabhSaving.new(sulabh_saving_params)

    respond_to do |format|
      if @sulabh_saving.save
        format.html { redirect_to @sulabh_saving, notice: 'Sulabh saving was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_saving }
      else
        format.html { render :new }
        format.json { render json: @sulabh_saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_savings/1
  # PATCH/PUT /sulabh_savings/1.json
  def update
    respond_to do |format|
      if @sulabh_saving.update(sulabh_saving_params)
        format.html { redirect_to @sulabh_saving, notice: 'Sulabh saving was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_saving }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_savings/1
  # DELETE /sulabh_savings/1.json
  def destroy
    @sulabh_saving.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_savings_url, notice: 'Sulabh saving was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_saving
      @sulabh_saving = SulabhSaving.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_saving_params
      params.require(:sulabh_saving).permit(:trans_type,:sulabh_user_profile_id, :sulabh_loan_confirm_id, :aadhaar, :transaction_date, :debitAmount, :creditAmount, :remarks, :status, :depositedinbank, :branch_name, :depositDate)
    end
end
