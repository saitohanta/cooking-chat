class Post < ApplicationRecord
  has_one_attached :cooking_image

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  belongs_to :member

end
