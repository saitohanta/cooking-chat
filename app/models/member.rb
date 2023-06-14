class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :posts, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recipe_favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarks_posts, through: :bookmarks, source: :post
  has_many :recipe_bookmarks, dependent: :destroy
  has_many :recipe_bookmarks_recipes, through: :recipe_bookmarks, source: :recipe

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = 'Guest'
    end
  end

  def own?(object)
    id == object.member_id
  end

  def bookmark(post)
    bookmarks_posts << post
  end

  def unbookmark(post)
    bookmarks_posts.delete(post)
  end

  def bookmark?(post)
    bookmarks_posts.include?(post)
  end

  def recipe_bookmark(recipe)
    recipe_bookmarks_recipes << recipe
  end

  def recipe_unbookmark(recipe)
    recipe_bookmarks_recipes.delete(recipe)
  end

  def recipe_bookmark?(recipe)
    recipe_bookmarks_recipes.include?(recipe)
  end

end
