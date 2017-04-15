class SulabhSavingsBalancesController < ApplicationController
  before_action :set_sulabh_savings_balance, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_savings_balances
  # GET /sulabh_savings_balances.json
  def index
    @sulabh_savings_balances = SulabhSavingsBalance.all
  end

  # GET /sulabh_savings_balances/1
  # GET /sulabh_savings_balances/1.json
  def show
  end

  # GET /sulabh_savings_balances/new
  def new
    @sulabh_savings_balance = SulabhSavingsBalance.new
  end

  # GET /sulabh_savings_balances/1/edit
  def edit
  end

  # POST /sulabh_savings_balances
  # POST /sulabh_savings_balances.json
  def create
    @sulabh_savings_balance = SulabhSavingsBalance.new(sulabh_savings_balance_params)

    respond_to do |format|
      if @sulabh_savings_balance.save
        format.html { redirect_to @sulabh_savings_balance, notice: 'Sulabh savings balance was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_savings_balance }
      else
        format.html { render :new }
        format.json { render json: @sulabh_savings_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_savings_balances/1
  # PATCH/PUT /sulabh_savings_balances/1.json
  def update
    respond_to do |format|
      if @sulabh_savings_balance.update(sulabh_savings_balance_params)
        format.html { redirect_to @sulabh_savings_balance, notice: 'Sulabh savings balance was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_savings_balance }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_savings_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_savings_balances/1
  # DELETE /sulabh_savings_balances/1.json
  def destroy
    @sulabh_savings_balance.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_savings_balances_url, notice: 'Sulabh savings balance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_savings_balance
      @sulabh_savings_balance = SulabhSavingsBalance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_savings_balance_params
      params.require(:sulabh_savings_balance).permit(:aadhar, :currentBal)
    end
end
