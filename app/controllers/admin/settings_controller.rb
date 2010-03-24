class Admin::SettingsController < ApplicationController
  before_filter :authenticate_user!
    
  def index
    @settings = Setting.all
  end

  def set
    Setting.update_all(:id => params[:setting_ids])
    redirect_to admin_settings_path
  end

end