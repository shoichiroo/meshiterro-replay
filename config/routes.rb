Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "follows" => "relationships#follows", as: "follows"
    get "followers" => "relationships#followers", as: "followers"
  end
  get "search" => "searches#search", as: "search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
