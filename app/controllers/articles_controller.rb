class ArticlesController < ApplicationController
    before_filter :authenticate_user! ,:except => [:index]
    load_and_authorize_resource :except=>[:index,:show]
    def index
    @search = Sunspot.search(Article) do
      fulltext params[:search]
      facet(:published_month)
      with(:published_month, params[:month]) if params[:month].present?
      paginate(page: params[:page], per_page: 10)
      order_by(:published_at, :desc)
    end
    @articles = @search.results
    #Article.all(:joins => :comments, :select => "articles.*, count(comments.id) as comments_count", :group => "articles.id")
    respond_to do |format|
        format.html
        format.js
    end  
    #@articles.
  end

  def show
    @article = Article.find(params[:id])
    @commentable = @article
    @comments = @commentable.comments
    @comment = Comment.new
    @rating = Rating.find_by_article_id_and_user_id(@article.id ,current_user.id)
    if @rating.blank?
      @rating = Rating.create(article_id: @article.id, user_id: current_user.id, score: 0)
    end
end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, notice: "Article was destroyed."
  end
end
