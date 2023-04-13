Rails.application.routes.draw do
  root 'home#index'

  get '/auth/spotify/callback', to: 'users#create'
  get 'auth/failure', to: 'users#failure'
  get '/logout', to: 'users#logout'
  get '/quizzes/:id', to: 'quizzes#show', as: 'quiz'
end
