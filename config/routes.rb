Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: 'destroy_user_session'
  end

  root 'welcome#index'

  get 'home' => 'home#index'

  resources :groups do
    collection do
      get :search
    end
  end

end
