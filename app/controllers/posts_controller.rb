class PostsController < ApplicationController

  def welcome
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end


  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end
  
end

