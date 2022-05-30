class HotSpringsController < ApplicationController
  def index
    @hot_springs = HotSpring.order('created_at DESC')
  end
end
