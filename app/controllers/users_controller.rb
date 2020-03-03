class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(:page => params[:page], :per_page => params[:per_page] ||= 30)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      begin
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "This is not the user you are looking for ..."
        respond_to do |format|
          format.html{
            redirect_to users_path
          }
          format.json {render :json, status: 404}
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end
