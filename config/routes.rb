Timesheet::Application.routes.draw do

  # Modify routes to point to devise controllers
  devise_for :users

  # Set the root of the application
  root :to => "users#index"

  # Create the /dashboard url to go to Users/Index
  match '/dashboard', :to => 'users#index'

  # resources :users do
  # 	resources :organizations do
  #     resources :projects
  #   end
  # end

  resources :users do
    resources :organizations
  end

  resources :organizations do
    resources :projects
  end

end