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
        render :action => 'edit'
    end
  end
  
  def edit    
    @question = Question.find(params[:id])
  end
  
  def vote
    @question = Question.find(params[:id])
    
    if @question.votes.map(&:user).include? current_user
      @message = "Changing your vote."
    end

    if @question.vote(!params[:up].blank?, current_user)
      @question.save
    else
      @message = "You've already voted for that question."
    end
    
    flash[:notice] = @message if @message
    
    respond_to do |format|
      format.html { redirect_to community_questions_url }
      format.any(:xml, :json) {
        response = @question.send("to_#{request.format.to_sym}", :only => :points)
        # response.merge!({:flash => @message}) unless @message.blank?
        render request.format.to_sym => response
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
