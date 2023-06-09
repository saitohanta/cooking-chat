class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.timestamps
      t.references :member, foreign_key: true, null: false #会員ID
      t.references :post, foreign_key: true, null: false #投稿ID
    end
  end
end
