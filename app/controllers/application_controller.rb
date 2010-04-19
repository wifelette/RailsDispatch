class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected

  def render_optional_error_file(status_code)
    status = interpret_status(status_code)
    render :template => "/errors/#{status[0,3]}.html.erb", :status => status, :layout => 'application'
  end
  
  def authenticate_admin!
    if current_user and current_user.admin?
      true
    else
      flash[:notice] = "Only admin users are able to see that"
      redirect_to root_url
      return false
    end
  end
end
