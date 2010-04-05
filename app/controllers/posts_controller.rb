class PostsController < ApplicationController
  respond_to :html, :rss

  def index
    @nav_posts = Post.recent

    @body_posts = Post.past
    @body_posts = @body_posts.slugged(params[:slug]) if params[:slug]
    @body_posts = @body_posts.limit(1) unless request.format.rss?

    @upcoming = Post.next
    respond_with @body_posts
  end

end
