class Public::BookmarksController < ApplicationController
  def index
  end

  def create
      @post = Post.find(params[:post_id])
      current_member.bookmark(@post)
      redirect_to post_path(@post)
  end

  def destroy
    @post = current_member.bookmarks.find(params[:post_id]).post
    current_member.unbookmark(@post)
    redirect_to post_path(@post)
  end
end
