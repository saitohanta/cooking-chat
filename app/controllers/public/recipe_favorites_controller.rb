class Public::RecipeFavoritesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_favorite = current_member.recipe_favorites.new(recipe_id: recipe.id)
    recipe_favorite.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    recipe_favorite = current_member.recipe_favorites.find_by(recipe_id: recipe.id)
    recipe_favorite.destroy
    redirect_to recipe_path(recipe)
  end
end
