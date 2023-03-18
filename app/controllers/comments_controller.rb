class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @post = Post.find(params[:post_id])
        if @comment.save
            redirect_to post_path(params[:author_id], @post)
        else
            render :new
        end
        
    end

    def show
        @comment = Comment.find(params[:comment_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:text).merge(author_id: current_user.id, post_id: params[:post_id])
    end
end

