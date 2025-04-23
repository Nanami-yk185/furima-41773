require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user: @user)
    end

    context '商品出品できるとき' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'nameが空だと無効' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end
      it 'descriptionが空だと無効' do
        @item.description = nil
        @item.valid?
        expect(@item.errors[:description]).to include("can't be blank")
      end

      it 'category_idが1だと無効' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it 'status_idが1だと無効' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors[:status_id]).to include("can't be blank")
      end

      it 'shipping_fee_idが1だと無効' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors[:shipping_fee_id]).to include("can't be blank")
      end

      it 'prefecture_idが1だと無効' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'shipping_day_idが1だと無効' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors[:shipping_day_id]).to include("can't be blank")
      end

      it 'imageが空だと無効' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it 'priceが空だと無効' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it 'priceが全角数字だと無効' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors[:price]).to include('は300以上9999999以下で入力してください')
      end

      it '価格が299円以下だと無効である' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('は300以上9999999以下で入力してください')
      end

      it '価格が10,000,000円以上だと無効である' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('は300以上9999999以下で入力してください')
      end
      it '価格が小数だと無効である' do
        @item.price = 999.99
        @item.valid?
        expect(@item.errors[:price]).to include('は300以上9999999以下で入力してください')
      end
    end
  end
end
