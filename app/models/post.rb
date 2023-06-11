class Post < ApplicationRecord
  has_one_attached :post_image

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  belongs_to :member

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

end
