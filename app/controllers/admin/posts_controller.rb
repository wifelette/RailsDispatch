class Admin::PostsController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :xml, :js
  
  def index
    # @posts = Post.all
    # @future_posts = @posts.future

    @future_posts = Post.future.order("publish_date desc").reverse
    @past_posts = Post.past.order("publish_date desc")
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])    
    if @post.save
        flash[:notice] = "Successfully updated post."
        redirect_to admin_posts_url
      else
        render :action => 'edit'
    end
  end
  
  def edit    
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      respond_with(@post, :location => admin_posts_url)
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with(@post, :location => admin_posts_url)
  end
end
