Rails.application.routes.draw do

  devise_for :representatives, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations, only: [:index] do
    resources :messages, module: :conversations, only: [:index, :create]
  end

  root to: 'conversations#index'
  
 # namespace :api, path: '', constraints: {subdomain: 'api'} do
  # namespace :api do
  #   constraints Constraint::ApiNgrok.new do
  #     namespace :v1 do
  #       post 'reply', to: 'api#reply'
  #       post 'lead', to: 'api/#lead'
  #     end
  #   end
  # end
  namespace :api do
    namespace :v1 do
      post 'lead', to: 'bizchat_api#lead'
      post 'reply', to: 'bizchat_api#reply'
    end
  end

  mount ActionCable.server => '/cable'
  
end
