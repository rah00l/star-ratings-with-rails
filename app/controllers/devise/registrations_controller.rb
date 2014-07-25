class Devise::RegistrationsController < DeviseController
  def new
    @user = User.new
  end

  def create
   @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

def edit
	@user = current_user
end

def update
    # For Rails 4
    # account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    # For Rails 3
    account_update_params = params[:user]

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
    	account_update_params.delete("password")
    	account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
    	set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
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


end