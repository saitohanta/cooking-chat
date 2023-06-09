class Recipe < ApplicationRecord
  has_one_attached :cooking_image

  has_many :recipe_favorites, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  has_many :recipe_bookmarks, dependent: :destroy

  belongs_to :member

  validates :cooking_image, presence: true
  validates :menu_name, presence: true
  validates :count, presence: true
  validates :material, presence: true
  validates :process, presence: true


  def favorited_by?(member)
    recipe_favorites.exists?(member_id: member.id)
  end

  def bookmarked_by?(member)
    recipe_bookmarks.where(member_id: member).exists?
  end

  def self.search(search)
    return Recipe.all unless search
    Recipe.where('menu_name LIKE(?)', "%#{search}%")
  end

end
