class Recipe < ApplicationRecord
  has_one_attached :cooking_image

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :member

  def self.search(search)
    return Recipe.all unless search
    Recipe.where('menu_name LIKE(?)', "%#{search}%")
  end

end
