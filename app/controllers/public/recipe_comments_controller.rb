class Public::RecipeCommentsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_comment = current_member.recipe_comments.new(recipe_comment_params)
    recipe_comment.recipe_id = recipe.id
    recipe_comment.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    RecipeComment.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:content)
  end

end
