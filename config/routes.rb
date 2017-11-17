Rails.application.routes.draw do
  resources :durations
  resources :requests do
  	member do
  		put 'deny'
  		put 'approve'
  	end
  end
  resources :users, except: [:create, :new] do
  	member do
  		get 'pending_requests'
  		get 'cc_requests'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'stores#index'
  get 'company-dashboard' => 'stores#company_dashboard'
end
