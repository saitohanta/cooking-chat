class RecipeComment < ApplicationRecord
   belongs_to :member
   belongs_to :recipe

   validates :content, presence: true
end
