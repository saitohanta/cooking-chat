class AddRecipeComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :recipe, foreign_key: true
  end
end
