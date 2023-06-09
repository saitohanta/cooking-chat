class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.references :member, foreign_key: true, null: false #会員ID
      t.string :title, null: false #タイトル
      t.text :body, null: false #本文
    end
  end
end
