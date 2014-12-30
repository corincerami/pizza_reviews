class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @username = @user.username
    @bio = @user.bio
    @name = "#{@user.first_name} #{@user.last_initial}."
  end
end
