class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def render_optional_error_file(status_code)
    status = interpret_status(status_code)
    # render :template => "/errors/#{status[0,3]}.html.erb", :status => status, :layout => 'application'
    render :text => "OK"
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

  def after_sign_in_path_for(resource)
    if request.session[:return_to].is_a? String
      [request.session[:return_to], request.session[:return_params].to_query].join("?")
    elsif request.session[:return_to].is_a? Hash
      request.session[:return_to].merge!(request.session[:return_params])
    else
      super
    end
  end
end
