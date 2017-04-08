class SulabhPasswordsController < ApplicationController
  before_action :set_sulabh_password, only: [:show, :edit, :update, :destroy]

  # GET /sulabh_passwords
  # GET /sulabh_passwords.json
  def index
    @sulabh_passwords = SulabhPassword.all
  end

  # GET /sulabh_passwords/1
  # GET /sulabh_passwords/1.json
  def show
  end

  # GET /sulabh_passwords/new
  def new
    @sulabh_password = SulabhPassword.new
  end

  # GET /sulabh_passwords/1/edit
  def edit
  end

  # POST /sulabh_passwords
  # POST /sulabh_passwords.json
  def create
    @sulabh_password = SulabhPassword.new(sulabh_password_params)

    respond_to do |format|
      if @sulabh_password.save
        format.html { redirect_to @sulabh_password, notice: 'Sulabh password was successfully created.' }
        format.json { render :show, status: :created, location: @sulabh_password }
      else
        format.html { render :new }
        format.json { render json: @sulabh_password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sulabh_passwords/1
  # PATCH/PUT /sulabh_passwords/1.json
  def update
    respond_to do |format|
      if @sulabh_password.update(sulabh_password_params)
        format.html { redirect_to @sulabh_password, notice: 'Sulabh password was successfully updated.' }
        format.json { render :show, status: :ok, location: @sulabh_password }
      else
        format.html { render :edit }
        format.json { render json: @sulabh_password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sulabh_passwords/1
  # DELETE /sulabh_passwords/1.json
  def destroy
    @sulabh_password.destroy
    respond_to do |format|
      format.html { redirect_to sulabh_passwords_url, notice: 'Sulabh password was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sulabh_password
      @sulabh_password = SulabhPassword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sulabh_password_params
      params.require(:sulabh_password).permit(:password, :expiry, :pin)
    end
end
