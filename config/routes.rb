Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create, :show, :destroy, :update]
    end
  end
end
