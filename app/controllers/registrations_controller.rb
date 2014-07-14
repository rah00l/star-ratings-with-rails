class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :only => :token

  # respond_to :html, :json

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

end