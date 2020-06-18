Rails.application.routes.draw do
  get'index',to:'home#index'
  get 'authentication',to: 'home#authentication'
  post 'verify',to: 'home#verify'
  get 'sent_opt',to: 'home#sent_opt'
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
