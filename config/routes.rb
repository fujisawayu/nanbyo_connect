Rails.application.routes.draw do
  root to: 'diseases#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
