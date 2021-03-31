Rails.application.routes.draw do   
 
  resource :feedback, only: %i[new create]
  root 'tests#index'

  devise_for :users, path: :gurus, path_names:{sign_in: :login, sign_out: :logout}, controllers: { confirmations: 'users/confirmations' }
  
  resources :tests, only: %i[index] do
    member do
      post :start
    end
  end

   resources :badges, only: %i[index] 
   get 'achievements', to: 'badges#achievements'
  
  resources :test_passages, only: %i[show update] do
    post :gist, to: 'gists#create'
    member do
      get :result
    end
  end


  namespace :admin do
    resources :gists
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
