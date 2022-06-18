class UsersController < ApplicationController
  before_action :set_q
  before_action :set_user, only: [:show,:edit,:update,:destroy]

  def show
    @comments = @user.comments
  end

  def edit
    redirect_to root_path unless (current_user.id == @user.id)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @user.id
      @user.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  private

  def set_q
    @q = HotSpring.ransack(params[:q])
  end

  def set_user
    @user = User.find(params[:id])
  end
 
  def user_params
    params.require(:user).permit([:nickname,:profile,:sex_id,:image])
  end
end
