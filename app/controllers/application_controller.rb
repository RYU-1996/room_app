class ApplicationController < ActionController::Base
  
  before_action :set_search, only: [:set_search]
  
  #def current_user
    #@current_user ||= User.find_by(id: session[:user_id])
  #end
  
  def set_search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
  
  def after_sign_in_path_for(resources)
    if current_user
      flash[:notice] = "Signed in successfully." 
      root_path 
    else
      users_profile_path 
    end
  end


end
