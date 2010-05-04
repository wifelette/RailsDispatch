class PostsController < ApplicationController
  respond_to :html, :rss

  def index
    @nav_posts = Post.recent

    @posts = Post.past
    @posts = @posts.slugged(params[:slug]) if params[:slug]
  end

  def show
    @nav_posts = Post.recent
    
    @post = Post.slugged(params[:slug]) if params[:slug]
    respond_with @post
  end

  def home
    @nav_posts = Post.recent

    @body_posts = Post.past
    @body_posts = @body_posts.slugged(params[:slug]) if params[:slug]
    @body_posts = @body_posts.limit(1) unless request.format.rss?

    @upcoming = Post.next
    respond_with @body_posts
  end

end
