class UsersController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path , notice: "Password was successfully updated."
    else
      render :edit 
    end
  end
  
  def get_states
    #@country = Country.find(params[:country_id], :joins => :states)
    @city = City.find(params[:city_id], joins: :state)

    respond_to do |format|
      format.js
    end
  end


  
end
