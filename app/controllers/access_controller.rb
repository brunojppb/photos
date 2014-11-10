class AccessController < ApplicationController


    before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout, :sign_up, :sign_up_confirm]

  def login
  end

  def sign_up
    @user = User.new
  end

  def sign_up_confirm
    user = User.new(user_params)
    if user.save
      flash[:notice] = "User created"
      redirect_to(:controller => 'users', :action => 'index')
    else
      flash[:error] = "Error!"
      render('sign_up')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You are logged out."
    redirect_to(:action => 'login')
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
        found_user = User.where(:username => params[:username]).first
        if found_user
            authorized_user = found_user.authenticate(params[:password])
        end
    end

    if authorized_user
        session[:user_id] = authorized_user.id
        session[:username] = authorized_user.username
        flash[:notice] = "Welcome #{authorized_user.name}."
        redirect_to(:controller => 'users', :action => 'index')
    else
        flash[:error] = "Error! username/passoword invalid"
        render('login')
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end

end
