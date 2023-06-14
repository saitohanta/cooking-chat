class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_member.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
  end

  def destroy
    Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
