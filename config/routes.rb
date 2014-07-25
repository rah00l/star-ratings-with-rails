Blog::Application.routes.draw do

  devise_for :users

#  root :to => "home#index"
devise_for :users ,:controllers => { :registrations => "devise/registrations" }

devise_scope :user do
  get "sign_in", :to => "devise/sessions#new"
  get "sign_up", :to => "devise/registrations#new"
  get "get_states" , :to => "devise/registrations#get_states"
  get "get_cities" , :to => "devise/registrations#get_cities"
  get "get_user_email_status" , :to => "devise/registrations#get_user_email_status"
end

# devise_for :users, :skip => [:registrations]

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



root to: 'articles#index'
end
