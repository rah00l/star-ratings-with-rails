Blog::Application.routes.draw do

  # get "music/index"

  # get "music/music"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # get "main/index"
  root :to => 'main#index'

  #  root :to => "home#index"
  devise_for :users , controllers: { registrations: "devise/registrations", :omniauth_callbacks => "omniauth_callbacks" } 
  # ActiveAdmin.routes(self)

devise_scope :user do
  get "sign_in", :to => "devise/sessions#new"
  get "sign_up", :to => "devise/registrations#new"
  get '/users/sign_out' => 'devise/sessions#destroy'
  get "get_states" , :to => "devise/registrations#get_states"
  get "get_cities" , :to => "devise/registrations#get_cities"
  get "get_user_email_status" , :to => "devise/registrations#get_user_email_status"
end

# devise_for :users, :skip => [:registrations]
  # ActiveAdmin.routes(self)

  match 'music', :to => "music#index"
  match '/music/:title', :to => "music#music", as: 'piece'

  resources :music do
    resource :music
  end


resource :user do
  collection do
    put 'update_password'
  end
end

resources :ratings, only: :update

resources :articles do
  resources :comments do 
    member { post :vote_for_article }
  end

end

resources :photos do
  resources :comments do
    member { post :vote_for_photo }
  end

end

resources :events do
  resources :comments
end



# root to: 'articles#index'
end
