class Public::RecipeBookmarksController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_member.recipe_bookmark(@recipe)
    @member = current_member
  end

  def destroy
    @recipe = current_member.recipe_bookmarks.find_by(recipe_id: params[:recipe_id]).recipe
    current_member.recipe_unbookmark(@recipe)
    @member = current_member
  end
end
