Rails.application.routes.draw do
  resources :recipes
  resources :ingredients
  resources :dogs
  root 'welcome#index'

  get 'jill' => 'student#jill'
  get 'jade' => 'student#jade'
  get 'zak' => 'student#zak'
  # get 'dog_recipes' => 'dog#dog_recipes'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
