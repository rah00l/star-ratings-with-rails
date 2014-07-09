class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :only => :token



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

  end