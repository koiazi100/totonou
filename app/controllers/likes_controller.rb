class LikesController < ApplicationController
  def create
    hot_spring = HotSpring.find(params[:hot_spring_id])
    comment = Comment.find(params[:comment_id])
    like = current_user.likes.new(hot_spring_id: hot_spring.id, comment_id: comment.id)
    like.save
    
  end

  def destroy
    hot_spring = HotSpring.find(params[:hot_spring_id])
    comment = Comment.find(params[:comment_id])
    like = current_user.likes.find_by(hot_spring_id: hot_spring.id, comment_id: comment.id)
    like.destroy
    
  end
end
