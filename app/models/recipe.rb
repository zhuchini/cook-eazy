class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_items
  has_many :ingredients, through: :recipe_items
  has_many :cooking_list_items
  has_many :cooking_lists, through: :cooking_list_items
end
