class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|

      t.timestamps
      t.references :member, foreign_key: true, null: false #会員ID
      t.references :post, foreign_key: true, null: false #投稿ID
    end
    add_index :bookmarks, [:member_id, :post_id], unique: :true
  end
end
