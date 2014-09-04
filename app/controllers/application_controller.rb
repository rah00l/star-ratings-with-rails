class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :set_user

	def set_user
		Attachment.current_user = current_user unless current_user.nil? 
	end


	rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = "Access denied."
		redirect_to root_url
	end
end
