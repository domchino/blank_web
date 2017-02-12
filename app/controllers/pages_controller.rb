class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to(home_path)
    end
  end

  def home
    if !user_signed_in?
      redirect_to(new_user_session_path)
    end
  end

  def about
  end

  def community
    if !user_signed_in?
      redirect_to(new_user_session_path)
    end
  end

  def profile
    if !user_signed_in?
      redirect_to(new_user_session_path)
    end
  end
end
