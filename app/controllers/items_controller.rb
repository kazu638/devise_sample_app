class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @user = User.find(current_user.id) if current_user
    @items = Item.where(user_id: current_user.id) if current_user
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(name: item_params[:name], price: item_params[:price], user_id: current_user.id)
    begin
      if @item.save
        redirect_to items_path, notice: "投稿に成功しました。"
      else
        flash.now[:alert] = "投稿に失敗しました。"
        render :new
      end
    rescue ActiveRecord::NotNullViolation
      redirect_to new_item_path, alert: "投稿に失敗しました。空欄の箇所がありませんか？"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    begin
      if item.update(item_params)
        redirect_to items_path, notice: "編集に成功しました。"
      else
        flash.now[:alert] = "編集に失敗しました。"
        render :edit
      end
    rescue ActiveRecord::NotNullViolation
      redirect_to edit_item_path, alert: "編集に失敗しました。空欄の箇所がありませんか？"
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to items_path, notice: "削除に成功しました。"
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :price)
    end
end