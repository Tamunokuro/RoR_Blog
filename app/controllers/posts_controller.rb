class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find_by(id: params.require(:author_id))
  end

  def show
    @post = Post.find_by(id: params.require(:post_id))
    @user = params.require(:author_id)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to post_path(@user, @post), notice: 'Post saved successfully'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
