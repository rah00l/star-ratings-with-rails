class PhotosController < ApplicationController
  before_filter :authenticate_user! ,:except => [:index]
  load_and_authorize_resource :except=>[:index,:show]
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @commentable = @photo
    @comments = @commentable.comments
    @comment = Comment.new
    @attachments = @photo.attachments.all
  end

  def new
    @photo = Photo.new
    @attachments = @photo.attachments.build
  end

  def edit
    @photo = Photo.find(params[:id])
    if @photo.attachments.count < 5
      4.times { @attachments = @photo.attachments.build }
     end 
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to @photo, notice: "Photo was successfully created."
    else
      render :new
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to @photo, notice: "Photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url, notice: "Photo was destroyed."
  end
end
