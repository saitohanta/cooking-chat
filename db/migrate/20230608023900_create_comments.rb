class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.references :member, foreign_key: true, null: false #会員ID
      t.references :post, foreign_key: true, null: false #投稿ID
      t.text :content, null: false #内容
    end
  end
end
