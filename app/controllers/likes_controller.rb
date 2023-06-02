class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.likes.create(post: @post)
    redirect_to @post
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    @like.destroy
    redirect_to @post
  end
end
