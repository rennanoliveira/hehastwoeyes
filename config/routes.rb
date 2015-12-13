Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: 'destroy_user_session'
  end

  root 'welcome#index'

  get 'home' => 'home#index'

  resources :groups, param: :code do
    collection do
      get :search
    end
    resources :group_draws, only: [:create]
    resources :participants
  end

end
