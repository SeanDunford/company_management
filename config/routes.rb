Timesheet::Application.routes.draw do

  # Modify routes to point to devise controllers
  devise_for :users

  # Set the root of the application
  root :to => "home#index"

  # Create the /dashboard url to go to Users/Index
  match '/dashboard', :to => 'users#index'

end
