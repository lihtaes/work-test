Rails.application.routes.draw do

  devise_for :representatives
  scope "/admin" do
    resources :representatives, :controller => 'representatives'
  end

  
  resources :conversations, only: [:index] do
    resources :messages, module: :conversations, only: [:index, :create]
  end

  root to: 'conversations#index' 

  namespace :api do
    namespace :v1 do
      post 'lead', to: 'bizchat_api#create_lead'
      post 'sms', to: 'bizchat_api#receive_sms_reply'
    end
  end

  mount ActionCable.server => '/cable'
  
end
