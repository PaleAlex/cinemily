module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def ricava_username(numero)
    @user = User.find(numero).username if numero
  end

  def already_commented(film)
    @i=1
    unless @i > film.articles.count
      film.articles.each do |art|
        if art.user == current_user
          return TRUE
        else
          @i = @i+1
        end
      end
    end
  end

  def count_likes_per_user(user)
    @somma = 0
    user.articles.each do |art|
      @somma += art.likes.count
    end
    return @somma
  end

end
