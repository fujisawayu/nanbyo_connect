Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'diseases#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  post '/diseases/guest_sign_in', to: 'diseases#guest_sign_in'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
