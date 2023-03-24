class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.save
      redirect_to post_path(params[:author_id], @post), notice: 'Comment created successfully'
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:comment_id])
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(params[:post_id])
    @comment.destroy
    redirect_to post_path(params[:author_id], @post), notice: 'Comment deleted successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(author_id: current_user.id, post_id: params[:post_id])
  end
end
