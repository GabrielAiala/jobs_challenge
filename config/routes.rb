Rails.application.routes.draw do
  resources :submissions, only: [:create, :show]
  resources :jobs

  put 'recruiters/:id', to: 'recruiters#update'
  get 'recruiters', to: 'recruiters#index'

  devise_for :recruiters, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'recruiters/sessions',
    registrations: 'recruiters/registrations'
  }
end
