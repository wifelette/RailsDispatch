class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected

  def render_optional_error_file(status_code)
    status = interpret_status(status_code)
    render :template => "/errors/#{status[0,3]}.html.erb", :status => status, :layout => 'application'
  end
end
