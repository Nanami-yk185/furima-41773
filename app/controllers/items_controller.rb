class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path # ← 成功したらトップページへ @item
    else
      render :new, status: :unprocessable_entity # ← エラー時はそのままnewを再表示
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :image, :price)
  end
end
