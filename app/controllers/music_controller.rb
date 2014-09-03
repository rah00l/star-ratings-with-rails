class MusicController < ApplicationController
  def index
  	@musics = Music.order("updated_at DESC")
	@featured_musics = Music.where(featured: true).order("updated_at DESC")
  end

  def music
  	@music = Music.find_by_title(params[:title])
	@music_attachments = @music.attachments
  end
end
