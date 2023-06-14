class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_member.favorites.new(post_id: @post.id)
    favorite.save
    @member = current_member
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_member.favorites.find_by(post_id: @post.id)
    favorite.destroy
    @member = current_member
  end
end
