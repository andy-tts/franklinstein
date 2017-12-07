Rails.application.routes.draw do
  resources :recipes
  resources :ingredients
  resources :dogs
  root 'welcome#index'

  get 'jill' => 'student#jill'
  get 'jade' => 'student#jade'
  get 'zak' => 'student#zak'
  # get 'dog_recipes' => 'dog#dog_recipes'
  get 'magic' => 'magic#index'
  post 'magic' => 'magic#index'
  get 'compare' => 'magic#compare'
  post 'compare' => 'magic#compare'
  get 'allPrint' => 'magic#allPrint'
  get 'compare_json' => 'magic#compare_json'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
