class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to :back
    else
      flash[:danger] = 'something wrong'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:from_user_id, :to_user_id, :body, :rating,
                                    :order_id)
  end

end
