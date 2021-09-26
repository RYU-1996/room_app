class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  before_action :set_search

  def set_search
    @search = Room.ransack(params[:q])
    @search_rooms = @search.result
  end
  
end
