Rails.application.routes.draw do
scope "(:lang)", lang:/ru|en/ do   
  
  
  devise_for :users, path: :gurus, path_names:{sign_in: :login, sign_out: :logout}, controllers: { confirmations: 'users/confirmations' }
  
  resources :tests, only: %i[index] do
    member do
      post :start
    end
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
  root 'tests#index'
  get '/:lang', to: 'tests#index'
end
