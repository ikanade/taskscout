Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users
  post 'pusher/auth' => 'pusher#auth'
  #get 'message' => 'messages#run'
  resources :users do
  	resources :projects
  end
  resources :projects, only: [] do
  	resources :tasks
  end
  resources :projects, only: [] do
    resources :posts  
  end
  resources :posts, only: [] do
    resources :comments  
  end
  resources :tasks, only: [] do
    resources :comments , controller: :task_comments ,only: [:create,:destroy]
  end
  resources :tasks, only: [] do 
    resources :tasks, controller: :sub_tasks 
  end
  resources :notifications, only: [:create,:index]
  get 'projects/:id/users/new' => 'project_users#new', as: :new_project_user
  post 'projects/:id/users/:user_id' => 'project_users#create', as: :add_project_user
  get 'projects/:id/users(.:format)' => 'project_users#index', as: :all_project_users
  

  post 'follow/post/:post_id'	=> 'follows#post', as: :follow_post
  delete 'unfollow/post/:post_id' => 'follows#unfollow_post',as: :unfollow_post
  post 'follow/task/:task_id'	=> 'follows#task', as: :follow_task
  delete 'unfollow/task/:task_id' => 'follows#unfollow_task', as: :unfollow_task
  get 'follows' => 'follows#index', as: :follows
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
