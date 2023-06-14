class Public::RecipeBookmarksController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
      current_member.recipe_bookmark(@recipe)
  end

  def destroy
    @recipe = current_member.recipe_bookmarks.find(params[:recipe_id]).recipe
    current_member.recipe_unbookmark(@recipe)
  end
end
