class LikesController < ApplicationController
  before_action :hot_spring_params
  
  def create
    Like.create(user_id: current_user.id, hot_spring_id: params[:id])

  end

  def destroy
    Like.find_by(user_id: current_user.id, hot_spring_id: params[:id]).destroy
    
  end

  private
  
  def hot_spring_params
    @hot_spring = HotSpring.find(params[:id])
  end

 
end
