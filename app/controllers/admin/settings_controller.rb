class Admin::SettingsController < ApplicationController
  before_filter :authenticate_user!
    
  def index
    @settings = Setting.all
  end

  def set
    # Setting.update_all(:id => params[:setting_ids])
    Setting.update_all(:setting_value => params[:setting_value])
    redirect_to admin_settings_path
  end

end
