class CreateRecipeFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_favorites do |t|

      t.timestamps
      t.references :member, foreign_key: true, null: false #会員ID
      t.references :recipe, foreign_key: true, null: false #レシピID
    end
  end
end
