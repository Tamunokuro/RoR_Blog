class LikesController < ApplicationController
    def create
        @like = Like.new(like_params)
        if @like.save!
            @like.likes_counter
            redirect_to post_path(params[:author_id], params[:post_id])
        else
            redirect_to post_path(params[:author_id], params[:post_id]), status: :not_found
            render :new
        end
    end
    
    private
    def like_params
        params.permit(:author_id, :post_id)
    end
end
  