Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations", sessions: "sessions" }

  root 'pages#home'

  resources :users do
    resources :bookings
  end

  mount Attachinary::Engine => "/attachinary"

#                           Prefix Verb     URI Pattern                                 Controller#Action
#                 new_user_session GET      /users/sign_in(.:format)                    devise/sessions#new
#                     user_session POST     /users/sign_in(.:format)                    devise/sessions#create
#             destroy_user_session DELETE   /users/sign_out(.:format)                   devise/sessions#destroy
#                    user_password POST     /users/password(.:format)                   devise/passwords#create
#                new_user_password GET      /users/password/new(.:format)               devise/passwords#new
#               edit_user_password GET      /users/password/edit(.:format)              devise/passwords#edit
#                                  PATCH    /users/password(.:format)                   devise/passwords#update
#                                  PUT      /users/password(.:format)                   devise/passwords#update
#         cancel_user_registration GET      /users/cancel(.:format)                     devise/registrations#cancel
#                user_registration POST     /users(.:format)                            devise/registrations#create
#            new_user_registration GET      /users/sign_up(.:format)                    devise/registrations#new
#           edit_user_registration GET      /users/edit(.:format)                       devise/registrations#edit
#                                  PATCH    /users(.:format)                            devise/registrations#update
#                                  PUT      /users(.:format)                            devise/registrations#update
#                                  DELETE   /users(.:format)                            devise/registrations#destroy
# user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)              users/omniauth_callbacks#passthru
#  user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)     users/omniauth_callbacks#facebook
#                             root GET      /                                           pages#home
#                    user_bookings GET      /users/:user_id/bookings(.:format)          bookings#index
#                                  POST     /users/:user_id/bookings(.:format)          bookings#create
#                 new_user_booking GET      /users/:user_id/bookings/new(.:format)      bookings#new
#                edit_user_booking GET      /users/:user_id/bookings/:id/edit(.:format) bookings#edit
#                     user_booking GET      /users/:user_id/bookings/:id(.:format)      bookings#show
#                                  PATCH    /users/:user_id/bookings/:id(.:format)      bookings#update
#                                  PUT      /users/:user_id/bookings/:id(.:format)      bookings#update
#                                  DELETE   /users/:user_id/bookings/:id(.:format)      bookings#destroy
#                            users GET      /users(.:format)                            users#index
#                                  POST     /users(.:format)                            users#create
#                         new_user GET      /users/new(.:format)                        users#new
#                        edit_user GET      /users/:id/edit(.:format)                   users#edit
#                             user GET      /users/:id(.:format)                        users#show
#                                  PATCH    /users/:id(.:format)                        users#update
#                                  PUT      /users/:id(.:format)                        users#update
#                                  DELETE   /users/:id(.:format)                        users#destroy
#                      attachinary          /attachinary                                Attachinary::Engine

end





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

