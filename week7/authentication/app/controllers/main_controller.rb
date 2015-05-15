class MainController < ApplicationController
  def index
    if is_loged_in?
      redirect_to user_path
    else
      render 'index_unregistred'
    end
  end
end