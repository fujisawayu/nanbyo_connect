Rails.application.routes.draw do
  root 'tops#index'
  # get 'tops', to: 'tops#index'
  resources :users, only: %i[show index new edit]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  post '/diseases/guest_sign_in', to: 'diseases#guest_sign_in'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
