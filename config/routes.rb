Rails.application.routes.draw do
  resources :tests do
  	member do
  		post :start
  	end 
  	resources :questions, shallow: true do
  		resources :answers, shallow: true
  	end
  end
  resources :test_passages, only: %i[show update] do
  	member do
  		get :result
  	end
  end
end
