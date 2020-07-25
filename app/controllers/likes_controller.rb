class LikesController < ApplicationController
  before_action :find_article
  before_action :find_like, only: [:destroy]

  def create
    @article.likes.create(user_id: current_user.id)
    redirect_to article_path(@article)
  end

  def destroy
    @like.destroy
    flash[:notice] = "Non apprezzi più questa recensione"
    redirect_to article_path(@article)
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_like
    @like = @article.likes.find(params[:id])
  end


end
