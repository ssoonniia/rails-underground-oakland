Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get ':id/delete'=> 'events#destroy'
  get 'auth/:provider' => redirect("/auth/google_oauth2")
  get 'auth/:provider/callback' => 'sessions#create_with_google'
  get 'auth/failure' => redirect('/')


  resources :users , except: [:destory]
  resources :events


  resources :events do
   resources :rsvps, only: [:index]
  end

  resources :user do
   resources :events do
    resources :rsvps, only: [:new, :create]
   end
  end

  resources :rsvps, only: [:destroy]
end
