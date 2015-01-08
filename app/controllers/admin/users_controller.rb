module Admin
  class UsersController < ApplicationController
    before_filter :authorize!
    def index
      @users = User.all
    end

    def destroy
    @user = User.find(params[:id])
      if @user.destroy
        flash[:notice] = "User deleted"
        redirect_to admin_users_path
      else
        render :show
      end
    end
  end
end
