class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update] # probably want to keep using this
  before_action :authenticate_admin!, only: [:index] 
  # GET /users
  # GET /users.json
  def index
    @admins = Admin.all
  end

  # # GET /admins/1
  # # GET /admins/1.json
  def show

  end

  # GET /admins/1/edit
  def edit

  end

  # # PATCH/PUT /admins/1
  # # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:name, :email)
  end
end
