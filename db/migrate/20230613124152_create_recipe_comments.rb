class CreateRecipeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_comments do |t|

      t.timestamps
      t.references :member, foreign_key: true, null: false #会員ID
      t.references :recipe, foreign_key: true, null: false #レシピID
      t.text :content, null: false #内容
    end
  end
end
