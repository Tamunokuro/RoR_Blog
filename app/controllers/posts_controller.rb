class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find_by(id: params.require(:author_id))
  end

  def show
    @post = Post.find_by(id: params.require(:post_id))
    @user = params.require(:author_id)
  end
end
