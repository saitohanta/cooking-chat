class CreateRecipeBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_bookmarks do |t|

      t.timestamps
      t.references :member, foreign_key: true, null: false #会員ID
      t.references :recipe, foreign_key: true, null: false #レシピID
    end
    add_index :recipe_bookmarks, [:member_id, :recipe_id], unique: :true
  end
end
