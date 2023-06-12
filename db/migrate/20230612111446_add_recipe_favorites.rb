class AddRecipeFavorites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorites, :recipe, foreign_key: true
  end
end
