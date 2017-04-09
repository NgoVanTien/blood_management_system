Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions", registrations: "registrations"}
  root "home#index"
  resource :profile, only: [:edit, :update]
  resource :setting_account, only: :update
end
