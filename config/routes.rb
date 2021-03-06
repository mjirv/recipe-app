Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # GroceryList routes
  get '/grocery_lists/:id/', to: 'grocery_lists#show', as: 'grocery_list'
  put '/grocery_lists/:id/', to: 'grocery_lists#update_and_show', as: 'update_and_show_grocery_list'
  get '/grocery_lists/edit/:id/', to: 'grocery_lists#update', as: 'edit_grocery_list'
  get '/grocery_lists/:id/item_mapping', to: 'grocery_lists#item_mapping', as: 'gl_item_mapping'
  post '/grocery_lists/email/:id/', to: 'grocery_lists#email', as: 'email_grocery_list'

  # GroceryListItem routes
  get '/grocery_list_items/edit/:id/', to: 'grocery_list_items#update', as: 'edit_grocery_list_item'
  get '/grocery_list_items/map/:id/', to: 'grocery_list_items#map', as: 'map_grocery_list_item'
  post '/grocery_list_items/map/:id/', to: 'grocery_list_items#map_post', as: 'map_post_grocery_list_item'
  patch '/grocery_list_items/:id/', to: 'grocery_list_items#edit_save', as: 'edit_save_grocery_list_item'
  get '/grocery_list_items/:id/', to: 'grocery_list_items#show', as: 'grocery_list_item'
  delete '/grocery_list_items/:id/', to: 'grocery_list_items#delete', as: 'delete_grocery_list_item'

  # User routes
  get '/users/:id/', to: 'users#show', as: 'user'
  get '/users/:id/edit/', to: 'users#update', as: 'edit_users'
  patch '/users/:id/', to: 'users#edit_save', as: 'edit_save_users'
    get '/users/:id/change_password/', to: 'users#change_password', as: 'change_password'
  patch '/users/:id/change_password/', to: 'users#change_password_save', as: 'change_password_save'

  # RecipeToUserLink routes
  get '/users/:id/recipes/', to: 'recipe_to_user_links#show_recipes', as: 'show_user_recipes'
  get '/users/:id/generate_recipes/', to: 'recipe_to_user_links#config_recipe_generation', as: 'config_recipe_generation'
  post '/users/:id/generate_recipes/', to: 'recipe_to_user_links#generate_recipes', as: 'generate_recipes'
  post '/users/:id/generate_recipe/', to: 'recipe_to_user_links#generate_recipe', as: 'get_new_user_recipe'
  delete '/users/:id/delete_recipe/:recipe_id/', to: 'recipe_to_user_links#delete_recipe', as: 'delete_user_recipe'
  post '/users/:id/delete_and_get_new_recipe/:recipe_id/', to: 'recipe_to_user_links#delete_and_generate_recipe', as: 'delete_and_get_new_user_recipe'
  get '/users/:user_id/change_grocery_list/:redirect_to_gl', to: 'grocery_lists#change_grocery_list', as: 'change_grocery_list'

  # GroceryList routes
  get '/users/:id/generate_grocery_list', to: 'grocery_lists#generate_grocery_list', as: 'generate_grocery_list'
  post '/users/:id/auto_instacart/:grocery_list_id', to: 'grocery_lists#auto_instacart', as: 'auto_instacart'

  # Tag routes
  get '/tags/:id', to: 'tag_to_recipe_links#show', as: 'tag_to_recipe_links'
  get '/tags/users/:user_id/recipe/:recipe_id', to: 'tag_to_recipe_links#index', as: 'show_recipe_tags'
  post '/tags', to: 'tag_to_recipe_links#create', as: 'add_recipe_tag'
  delete '/tags/:recipe_id/:tag_id', to: 'tag_to_recipe_links#delete', as: 'delete_recipe_tag'
  get '/users/autocomplete/tags', to: 'users#autocomplete_tag_name', as: 'autocomplete_tag_name_users'

  # Session routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Not 100% sure what this does
  resources :users

  # The dashboard
  get '/dashboard/:id/', to: 'dashboard#show', as: 'dashboard'

  root 'application#index'
end
