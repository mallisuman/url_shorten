Rails.application.routes.draw do
  get 'links/index'
  get 'links/show'

  # get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  # root 'welcome#index'

  root 'links#index'
  resources :links do
  	get :analytics, on: :member
  end

  get '/:abc', to: 'links#send_to_url'

  # post '/:xyz'  to: 'links#show'

end

