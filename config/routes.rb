Test::Application.routes.draw do
  get "users/index"

  get '/invite' => "admins#invite", as: :invite_writer
  post '/invite' => "admins#welcome"
  resources :writers
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  root :to => redirect("/login")
end
