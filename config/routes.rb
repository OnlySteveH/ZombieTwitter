Rails.application.routes.draw do
  resources :zombies, :tweets
  #get 'zombies/:id', to: 'zombies#show'

  #get 'tweets/:id', to: 'tweets#show'
  get '/new_tweet' => 'tweets#new'
  get '/all' => 'tweets#index', as: 'all_tweets'
  get '/all' => redirect('/tweets')
  root to: '/tweets#index'
end
