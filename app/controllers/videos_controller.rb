class VideosController < ApplicationController


def index
  @videos = Video.order('created_at DESC')
end

def new
  @video = Video.new
end
 
def create
  @video = Video.new(params[:video])
  if @video.save
    flash[:notice] = 'Video was successfully created.'
    redirect_to videos_path
  else
    render 'new'
  end
end

end