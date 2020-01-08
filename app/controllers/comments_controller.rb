class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: 1)
    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id])  }
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: 1, item_id: params[:item_id])
  end
end
