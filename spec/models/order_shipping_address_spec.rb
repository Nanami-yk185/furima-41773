require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての必須項目が正しく入力されていれば保存できること' do
      expect(@order_shipping_address).to be_valid
    end

    it '建物名が空でも保存できること' do
      expect(@order_shipping_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空では保存ができないこと' do
      @order_shipping_address.postal_code = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがない場合は保存できないこと' do
      @order_shipping_address.postal_code = '1234567'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it 'postal_codeに不備がある場合は保存できないこと' do
      @order_shipping_address.postal_code = '123-45'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end

    it 'prefecture_idが空では保存できないこと' do
      @order_shipping_address.prefecture_id = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが1(未選択項目)の場合は保存できないこと' do
      @order_shipping_address.prefecture_id = 1
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では保存できないこと' do
      @order_shipping_address.city = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では保存できないこと' do
      @order_shipping_address.address = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では保存できないこと' do
      @order_shipping_address.phone_number = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが12桁以上の場合は保存できないこと' do
      @order_shipping_address.phone_number = '090123456789'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'phone_numberが9桁以下の場合は保存できないこと' do
      @order_shipping_address.phone_number = '090123456'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Phone number is too short')
    end

    it 'phone_numberが数字以外の値では保存できないこと' do
      @order_shipping_address.phone_number = 'abc123'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'tokenが空では保存できないこと' do
      @order_shipping_address.token = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors[:token]).to be_present
    end

    it 'user_idが空では保存できないこと' do
      @order_shipping_address.user_id = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors[:user_id]).to be_present
    end

    it 'item_idが空では保存できないこと' do
      @order_shipping_address.item_id = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors[:item_id]).to be_present
    end
  end
end
