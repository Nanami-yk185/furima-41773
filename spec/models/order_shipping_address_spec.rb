require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it 'priceとtokenがあれば保存ができること' do
      expect(@order_shipping_address).to be_valid
    end
  end

  context '内容に問題がある場合' do # ()
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
      expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが短すぎる場合、保存できないこと' do
      @order_shipping_address.phone_number = '#'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Phone number is too short')
    end
  end

  it 'phone_numberが数字以外の値では保存できないこと' do
    @order_shipping_address.phone_number = 'abc123'
    @order_shipping_address.valid?
    expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
  end
end
