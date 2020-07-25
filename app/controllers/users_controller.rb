class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Grazie per esserti iscritto #{@user.username}. Ora puoi aggiungere film e commenti!"
      session[:user_id] = @user.id
      redirect_to films_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profilo modificato"
      redirect_to films_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  
    @users = User.all
    #da vedere come ordinare per recensioni aggiunte o simile
  end





    private

    def user_params
      params.require(:user).permit(:username, :email)
    end

end
