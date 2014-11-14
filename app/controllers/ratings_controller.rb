class RatingsController < ApplicationController

  def update
    @rating = Rating.find(params[:id])
    @article = @rating.article
    # flash.now[:notice] =  "Thank you for rating!"

    if @rating.update_attributes(score: params[:score])
		respond_to do |format|
      	 format.js {  flash[:notice] = "Thank you for rating!" }
      end
    end
  end

end