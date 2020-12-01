Rails.application.routes.draw do
  devise_for :users
  
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :todo_lists do
      resources :todo_items do
        member do
          patch :toggle
        end
      end
    end

    root to: "todo_lists#index"

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
