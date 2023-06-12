class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|

      t.timestamps
      t.references :member, foreign_key: true, null: false #会員ID
      t.string :menu_name, null: false #メニュー名
      t.string :count, null: false #人数
      t.text :material, null: false #材料
      t.text :process, null: false #作り方
    end
  end
end
