class UsersController < ApplicationController

  before_action :confirm_logged_in


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        flash[:notice] = "User #{@user.name} saved."
        redirect_to(:action => 'index')
    else
        render('new')
    end
  end

  def show
    @user = User.find_by_id(params[:user_id])
  end

  def edit
  end

  def delete
  end

  private
    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end
end
