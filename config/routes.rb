Rails.application.routes.draw do
  get 'reviews/create'
  devise_for :users
  root to: 'pages#landing'

  # Recipes Routes
  get 'recipes' => 'recipes#index', as: :recipes
  get 'recipes/:id' => 'recipes#show', as: :recipe
  get 'recipes/:id/popup' => 'recipes#popup', as: :recipe_popup
  get 'recipes/:id/steps' => 'recipes#steps', as: :recipe_steps
  get 'recipes/:id/steps/:step_number' => 'recipes#steps'
  post 'recipes/:id/reviews' => 'reviews#create', as: :recipe_reviews

  # Grocery Lists Routes
  get 'grocery-list' => 'grocery_items#index', as: :grocery_items
  post 'grocery-list' => 'grocery_items#create', as: :new_grocery_item
  patch 'grocery-list/:id/check' => 'grocery_items#check', as: :check_grocery_item
  patch 'grocery-list/:id/uncheck' => 'grocery_items#uncheck', as: :uncheck_grocery_item
  patch 'grocery-list/:id/increase' => 'grocery_items#increase', as: :increase_grocery_item
  patch 'grocery-list/:id/decrease' => 'grocery_items#decrease', as: :decrease_grocery_item
  patch 'grocery-list' => 'grocery_items#update'

  # Fridge Routes
  get 'fridge' => 'fridge_items#index', as: :fridge
  post 'fridge' => 'fridge_items#create', as: :add_fridge_item
  delete 'fridge/:id/delete' => 'fridge_items#delete', as: :delete_fridge_item
  patch 'fridge/:id/increase' => 'fridge_items#increase', as: :increase_fridge_item
  patch 'fridge/:id/decrease' => 'fridge_items#decrease', as: :decrease_fridge_item
  patch 'fridge/fill' => 'fridge_items#fill'
  patch 'fridge/empty' => 'fridge_items#empty'

  # Cooking Lists Routes
  get 'cooking_list' => 'cooking_list_items#index'
  patch 'recipes/:id/add-to-cooking-list' => 'cooking_list_items#create', as: :add_recipe_to_cooking_list
end
