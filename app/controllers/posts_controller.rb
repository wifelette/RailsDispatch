class PostsController < ApplicationController
  
  def welcome
    @posts = Post.recent
    @upcoming = Post.next

    respond_to do |format|
      format.html # index.html.erb
    end
  end


  def index
    # @posts = Post.published
    # @upcoming = Post.upcoming
    @posts = Post.recent

    respond_to do |format|
      format.html # index.html.erb
      format.rss  { render :layout => false }
    end
  end
  
  def feed
    @posts = Post.recent

    respond_to do |format|
      format.rss  { render :layout => false }
    end
  end
  
  def show
    @post = Post.slugged(params[:slug])
    @posts = Post.recent
    @upcoming = Post.next
  end
  
end

