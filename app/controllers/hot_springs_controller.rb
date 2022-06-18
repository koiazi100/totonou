class HotSpringsController < ApplicationController
  before_action :move_to_sign_up, only: [:create, :edit,:search]
  before_action :set_hot_spring, only: [:show, :edit, :update]
  before_action :set_q, only: [:index, :show, :search,:edit, :new]
  def index
    @hot_springs = HotSpring.all
    @saunas = Sauna.new
    @comments = Comment.all
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

  def show
    @comments = @hot_spring.comments.includes(:user)
    @comment = Comment.new
    
  end

  def edit
    hot_spring_attributes = @hot_spring.attributes
    @sauna = Sauna.new(hot_spring_attributes)
  end

  def update

    @sauna = Sauna.new(sauna_params)
    @sauna.image ||= @hot_spring.image.blob if @hot_spring.image.present?
    if @sauna.valid? 
       @sauna.update(sauna_params, @hot_spring)
       redirect_to root_path
    else
      render :edit
    end
  end

  def search
    @results = @q.result
  end

  
  private

  def sauna_params
    params.require(:sauna).permit(:image,:name,:prefecture_id,:postcode ,:city,:block,:building,:homepage,:hot_temperture,:cold_temperture,:people_count,:remarks,:w_hot_temperture,:w_cold_temperture,:w_people_count,:w_remarks,:hot_spring_id).merge(user_id: current_user.id)
  end

  def set_hot_spring
    @hot_spring = HotSpring.find(params[:id])
  end

  def move_to_sign_up
    redirect_to new_user_session_path unless user_signed_in?
  end


  def set_q
    @q = HotSpring.ransack(params[:q])
  end
end
