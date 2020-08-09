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
          return true
        else
          @i = @i+1
        end
      end
    end
  end

end
