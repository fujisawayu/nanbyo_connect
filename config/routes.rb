Rails.application.routes.draw do
  root 'tops#index'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :users, only: %i[ show edit update ]
  get '/mypage' => 'users#mypage'

  resources :diseases do
    resources :treatments
    resources :expenses 
    resources :comments, only: %i[create destroy edit update]
    collection do
      get 'search'
    end
  end
  resources :onsets, only: %i[create destroy index]
  
  post '/diseases/guest_sign_in', to: 'diseases#guest_sign_in'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end