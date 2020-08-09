class SearchesController < ApplicationController

  def new
    @search = Search.new
    @genres = Film.pluck(:genre).uniq
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end


  private

  def search_params
    params.require(:search).permit(:title, :genre, :director, :min_year, :max_year)
  end

end
