Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'
  get 'create' => 'users#create'
  get 'delete' => 'users#delete'
  get 'toggle_score' => 'users#toggle'
end
