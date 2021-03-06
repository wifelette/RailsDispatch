class Admin::NotificationsController < ApplicationController
  before_filter :authenticate_user!, :authenticate_admin!
  
  respond_to :html, :xml, :js
  
  def index
    @notifications = Notification.all
  end
  
  def new
    @notification = Notification.new
  end
  
  def create
    @notification = Notification.new(params[:notification])
    if @notification.save
      flash[:notice] = "Successfully created notification."
      redirect_to admin_notifications_url
    else
      render :action => 'new'
    end
  end
  
  def edit    
    @notification = Notification.find(params[:id])
  end
  
  def update
    @notification = Notification.find(params[:id])
    if @notification.update_attributes(params[:notification])
      flash[:notice] = "Successfully updated notification."
      redirect_to admin_notifications_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    respond_with(@notification, :location => admin_notifications_url)
  end

end
