Rails.application.routes.draw do
  devise_for :users
  
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :toggle
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "todo_lists#index"
end
