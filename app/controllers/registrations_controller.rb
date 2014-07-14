class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :only => :token

  # respond_to :html, :json
    def edit
      raise "edit".inspect
    end

    def update
      raise "hello".inspect
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end


  def get_states
    @country = Country.find(params[:country_id], joins: :states)
    respond_to do |format|
      format.js
    end
  end

  def get_cities
    @state = State.find(params[:state_id], joins: :cities)
    respond_to do |format|
      format.js
    end
  end

  def get_user_email_status
    @user = User.find_by_email(params[:user_email])
    if @user.present?
      msg = { :status => "false", :message => "Email address Not available ..!" }
      render :json => msg #@user.to_json
    else
      msg = { :status => "true", :message => "Email address Available ..!" }
      render :json => msg 
    end
  end


  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present?
  end


end