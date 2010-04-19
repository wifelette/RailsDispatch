class Admin::SettingsController < ApplicationController
  before_filter :authenticate_user!, :authenticate_admin!
    
  def index
    @settings = Setting.all
  end

  def set
    #this is what I think your action should do
    params[:settings].each do |setting|
      @setting = Setting.find(setting[:id])
      @setting.update_attributes(setting)
    end

    redirect_to admin_settings_path
  end

end
