# Aplicação desafio

 para instalar rodar

```
bundle install
rails db:create
rails db:migrate
```

para rodar a aplicação basta rodar com o comando

```
rails s
```

temos apenas essas rotas

```
  resources :submissions, only: [:create, :show]
  resources :jobs

  put 'recruiters/:id', to: 'recruiters#update'
  get 'recruiters', to: 'recruiters#index'

  devise_for :recruiters, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
```

para rodar os testes

```
bundle exec rspec .
```
