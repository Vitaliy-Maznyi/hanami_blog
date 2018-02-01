root to: 'posts#index'
resources :posts
resources :comments, only: [:create, :destroy]

get '/sign_in', to: 'sessions#new', as: :new_session
post '/sign_in', to: 'sessions#create', as: :sessions
delete '/sign_out', to: 'sessions#destroy', as: :destroy_session
post '/sign_up', to: 'registrations#create', as: :registrations
get '/sign_up', to: 'registrations#new', as: :new_registration
