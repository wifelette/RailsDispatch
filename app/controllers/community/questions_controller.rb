class Community::QuestionsController < ApplicationController  
  respond_to :html, :xml, :js
  
  def index
    @questions = Question.unanswered.by_points.paginated(params[:page]).all
  end
  
  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params[:question])    
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
    if params[:up]
      @question.points = @question.points.to_i + 1
    elsif params[:down]
      @question.points = @question.points.to_i - 1
    end
    @question.save
    
    respond_to do |format|
      format.html { redirect_to community_questions_url }
      format.any(:xml, :json, :js) { render request.format.to_sym => @question }
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
