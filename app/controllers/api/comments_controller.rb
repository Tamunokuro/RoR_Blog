class Api::CommentsController < Api::ApplicationController
  def index
    @comments = Comment.all.where(author_id: params.require(:author_id), post_id: params.require(:post_id))
    render json: @comments
  end

  def create
    request_body = JSON.parse(request.body.read)
    comment = Comment.new(author_id: current_user.id, post_id: params.require(:post_id),
                          text: request_body['comment'])
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
