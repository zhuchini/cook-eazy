class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show popup]
  before_action :set_recipe, only: %i[popup done! steps]

  def index
    @recipes = Recipe.all
    @fridge_items = FridgeItem.where(user: current_user)
  end

  def popup
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.js { render 'show_popup.js.erb', recipe: @recipe }
    end
  end

  def steps
    @steps = @recipe.steps.order(order: :asc)
    @length = @steps.length - 1
  end

  def done!
    @ingredients = @recipe.ingredients
    empty_fridge(@ingredients)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
