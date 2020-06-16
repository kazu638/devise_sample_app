class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @user = User.find(current_user.id)
    @items = Item.where(user_id: current_user.id).includes(:user).page(params[:page]).per(20)
  end
end
