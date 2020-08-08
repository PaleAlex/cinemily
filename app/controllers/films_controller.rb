class FilmsController < ApplicationController

  def index
    @films = Film.where(["title like ?","%#{params[:search]}%"]).order(created_at: :desc)
  end

  def show
    @film = Film.find(params[:id])
    @film_save = @film.id
    @articles = @film.articles
  end

  def edit
  end

  def update
  end

  def new
    @film = Film.new(:user_id => params[:user_id])
  end

  def create
    @film = Film.new(whitelist_film_params)
    if @film.save
      flash[:notice] = "Film aggiunto alla lista"
      redirect_to films_path
    else
      render 'new'
    end
  end

  def destroy
    @film.destroy
    flash[:notice] = "Film deleted succesfully"
    redirect_to films_path
  end

  private

  def whitelist_film_params
    params.require(:film).permit(:title, :year, :director, :genre, :user_id, :search)
  end



end
