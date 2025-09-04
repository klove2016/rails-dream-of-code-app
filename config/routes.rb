# /config/routes.rb
Rails.application.routes.draw do
  resources :students
  resources :mentors
  resources :enrollments
  resources :mentor_enrollment_assignments
  resources :lessons
  resources :courses
  resources :coding_classes

  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check


  get  "/trimesters",          to: "trimesters#index", as: "trimesters"
  get  "/trimesters/new",      to: "trimesters#new",   as: "new_trimester"
  get  "/trimesters/:id",      to: "trimesters#show",  as: "trimester"
  get  "/trimesters/:id/edit", to: "trimesters#edit",  as: "edit_trimester"

  post "/trimesters",          to: "trimesters#create" 
  
  patch "/trimesters/:id",     to: "trimesters#update"
  put   "/trimesters/:id",     to: "trimesters#update"
  delete "/trimesters/:id", to: "trimesters#destroy"

end
