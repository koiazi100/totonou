class CommentsController  < ApplicationController
  
  def index
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    if @comment.save
      CommentChannel.broadcast_to @hot_spring, { comment: @comment, user: @comment.user}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, {images: []}).merge(user_id: current_user.id, hot_spring_id: params[:hot_spring_id])
  end
end
