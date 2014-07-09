Blog::Application.routes.draw do

  devise_for :users

#  root :to => "home#index"
devise_for :users ,:controllers => { :registrations => "registrations" }

devise_scope :user do
  get "sign_in", :to => "devise/sessions#new"
  get "get_states" , :to => "registrations#get_states"
  get "get_cities" , :to => "registrations#get_cities"
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
