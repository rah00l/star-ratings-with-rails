module ApplicationHelper

	def backgroung_image_for_home
		render partial: 'shared/home_bg_image' if controller_name == 'main' && action_name == 'index'
	end

	def get_provider_image_info(provider)
		puts "provider's choice is: #{provider}"
		provider_choice = provider
		case provider_choice
			when "facebook"
  				img_name = "facebook_64.png"
  				img_alt  = "facebook"
			when "google_oauth2"
			  	img_name = "google_64.png"
  				img_alt  = "google"
			when "github"
  				img_name = "github_64.png"
  				img_alt  = "github"
  			when "linkedin"
  				img_name = "linkedin_64.png"
  				img_alt  = "linkedin"
  			when "twitter"
  				img_name = "twitter_64.png"
  				img_alt  = "twitter"
			else
  				puts "You just making it up!"
			end
			return img_name,img_alt
		end
end
