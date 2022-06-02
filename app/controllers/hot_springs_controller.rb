class HotSpringsController < ApplicationController
  #before_action :move_to_sign_up, only: [:create]
  #before_action :set_hot_spring, only: [:show, :edit, :update, :destroy]
  def index
    @hot_springs = HotSpring.all
    
    @saunas = Sauna.new
  end

  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)
    if @sauna.valid?
      @sauna.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def sauna_params
    params.require(:sauna).permit(:image,:name,:prefecture_id,:postcode ,:city,:block,:building,:homepage,:hot_temperture,:cold_temperture,:people_count,:remarks,:w_hot_temperture,:w_cold_temperture,:w_people_count,:w_remarks,:hot_spring_id).merge(user_id: current_user.id)
  end

  #def set_hot_spring
    #@hot_spring = HotSpring.find(params[:id])
  #end

  def move_to_sign_up
    redirect_to new_user_session_path unless user_signed_in?
  end

end
