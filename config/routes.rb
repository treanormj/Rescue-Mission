Rails.application.routes.draw do
  root 'questions#index'

  # :index will give us a list of things, :show gives us details on an individual objects.
  # the new shows the form and create will send the data to the database.
  resources :questions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :answers, only: [:create, :new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
