Rails.application.routes.draw do
  root 'welcome#index'

  get 'jill' => 'student#jill'
  get 'jade' => 'student#jade'
  get 'zak' => 'student#zak'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
