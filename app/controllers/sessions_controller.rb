class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(:email => params[:email])
    if (@user && @user.authenticate(params[:password]))
      session[:user_id] = @user.id
      flash[:notice] = "Hello, #{@user.name}!"
      redirect_to root_path
    else
      flash.now[:notice] = "login failed"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
