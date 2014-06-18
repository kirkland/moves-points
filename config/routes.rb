MovesPoints::Application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/logged_out', to: 'welcome#logged_out'
  root to: 'welcome#index'
end
