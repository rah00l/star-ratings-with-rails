class ArticlesController < ApplicationController
    before_filter :authenticate_user! ,:except => [:index]
  def index
    @articles = Article.all
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
    unauthorized! if cannot? :edit, @article
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
