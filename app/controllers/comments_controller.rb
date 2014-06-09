class CommentsController < ApplicationController
  before_filter :load_commentable, expect: [:vote_for_article,:vote_for_photo]
  
  def index
    @comments = @commentable.comments.find_with_reputation(:votes, :all, order: 'votes desc')
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  def vote_for_article
    value = params[:type] == "up" ? 1 : -1
    @comment = Comment.find(params[:id])
    @comment.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end

  def vote_for_photo
    value = params[:type] == "up" ? 1 : -1
    @comment = Comment.find(params[:id])
    @comment.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end



  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # def load_commentable
  #   klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end
end
