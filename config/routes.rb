Rails.application.routes.draw do

  root to: "homes#top"
  get"/homes/about"=>"homes#about",as:"homes_about"

  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books, only: [:create,:show,:index,:edit,:update,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

