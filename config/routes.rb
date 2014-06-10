MovesPoints::Application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  root to: 'welcome#index'
end
