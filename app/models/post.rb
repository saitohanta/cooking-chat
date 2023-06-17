class Post < ApplicationRecord
  has_one_attached :post_image

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :members, through: :bookmars
  

  belongs_to :member

  validates :title, presence: true
  validates :body, presence: true


  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

  def bookmarked_by?(member)
    bookmarks.where(member_id: member).exists?
  end

  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%")
  end

end
