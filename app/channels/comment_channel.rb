class CommentChannel < ApplicationCable::Channel
  def subscribed
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    stream_for @hot_spring
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
