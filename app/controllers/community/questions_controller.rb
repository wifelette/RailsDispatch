class Community::QuestionsController < ApplicationController  
  respond_to :html, :xml, :js
  
  before_filter :authenticate_user!, :only => [:create, :vote]
  
  def index
    @questions = Question.unanswered.paginated(params[:page]).by_points.all
  end
  
  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new(params[:question])
  end
  
  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
        flash[:notice] = "Successfully updated post."
        redirect_to community_questions_url
      else
        render :action => 'new'
    end
  end
  
  def edit    
    @question = Question.find(params[:id])
  end
  
  def vote
    @question = Question.find(params[:id])
    voted = @question.votes.map(&:user).include? current_user

    if @question.vote(!params[:up].blank?, current_user)
      @question.save
      message = "Changing your vote." if voted
    else
      message = voted ? "You've already voted for that question." : "You can't vote on your own question."
    end
    
    flash[:notice] = message if message
    
    respond_to do |format|
      format.html { redirect_to community_questions_url }
      format.any(:xml, :json) {
        @question.message = message
        render request.format.to_sym => @question.send("to_#{request.format.to_sym}", :only => :points, :methods => :message)
      }
    end
  end
  # 
  # def update
  #   @post = Post.find(params[:id])
  #   if @post.update_attributes(params[:post])
  #     respond_with(@post, :location => admin_posts_url)
  #   end
  # end
  # 
  # def destroy
  #   @post = Post.find(params[:id])
  #   @post.destroy
  #   respond_with(@post, :location => admin_posts_url)
  # end
end
