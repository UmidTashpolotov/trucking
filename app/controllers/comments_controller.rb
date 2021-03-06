class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.find(params[:order_id])
    @comment = @order.comments.create(comment_params)
    @comment.from_user_id = current_user.id
    @comment.to_user_id = (current_user.worker? ? @order.user.id : @order.worker.id)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'something wrong'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rating)
  end

end
