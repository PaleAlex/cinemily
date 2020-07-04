class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @article = Article.new(:film_id => params[:film_id])
  end

  def edit
  end

  def create
    @article = Article.new(whitelist_article_params)
	  if @article.save
      flash[:notice] = "Recensione aggiunta"
	    redirect_to film_path(@article.film_id)
    else
      render 'new'
    end
  end

  def update
    if @article.update(whitelist_article_params)
      flash[:notice] = "Commento modificato"
      redirect_to @article
    else
      render 'edit'
    end
	end

  def destroy
    @article.destroy
    flash[:notice] = "Commento cancellato"
    redirect_to films_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def whitelist_article_params
    params.require(:article).permit(:title, :description, :film_id)
  end

end
