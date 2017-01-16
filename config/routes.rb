Rails.application.routes.draw do
  get '/' => 'pages#home'
  post '/stop' => 'pages#stop'
end
