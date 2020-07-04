class FilmsController < ApplicationController

  def index
    @films = Film.where(["title LIKE ?","%#{params[:search]}%"]).order(created_at: :desc)
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
    @film = Film.new
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
    params.require(:film).permit(:title, :year, :director, :genre, :film_id, :search )
  end



end
