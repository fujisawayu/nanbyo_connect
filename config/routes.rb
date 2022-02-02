Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'diseases#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
