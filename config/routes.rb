Rails.application.routes.draw do
  get 'links/index'
  get 'links/show'

  # get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  # root 'welcome#index'

  root 'links#index'
  resources :links

  get '/:abc', to: 'links#send_to_url'
end

