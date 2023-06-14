class Public::BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.all
  end

  def create
      @post = Post.find(params[:post_id])
      current_member.bookmark(@post)
  end

  def destroy
    @post = current_member.bookmarks.find(params[:post_id]).post
    current_member.unbookmark(@post)
  end
end
