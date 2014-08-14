require 'rss'
require 'open-uri'
class MainController < ApplicationController
  def index
    # @tags = Tag.where(featured: true).order("title ASC")
    # @featured_slideshows = Slideshow.where(featured: true).order("title ASC")
    # @title = "Home"
    # @piece = Piece.where(featured: true).order("priority DESC").first
    # @project = Project.where(featured: true).order("priority DESC").first
    # @news = News.order("priority DESC").first(2)
    # @media = Media.where(featured: true).order("priority DESC").first(3)
    @photo = Photo.last
    begin
      @latest_blog_posts = RSS::Parser.parse(open('http://andrewlinford.wordpress.com/feed/').read, false).items[0...5]
      # @latest_blog_posts = RSS::Parser.parse(open('http://richonrails.com/?format=atom').read, false).items[0...5]
    rescue 
      @latest_blog_posts = nil
    end
  end
end