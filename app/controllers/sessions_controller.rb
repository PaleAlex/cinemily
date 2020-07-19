class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) && User.find_by(username: params[:session][:username]) #accertarsi della seconda parte
    if user
      session[:user_id] = user.id
      flash[:notice] = "Bentornato #{user.username}"
      redirect_to root_path
    else
      flash.now[:alert] = "Credenziali errate. Fai attenzione alle maiuscole."
      render 'new'
    end
  end

  def destroy
    flash[:notice] = "A presto, #{current_user.username}"
    session[:user_id] = nil
    redirect_to root_path
  end

end
