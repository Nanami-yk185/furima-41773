require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複していると登録できない' do
      # facrotybot.
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@なしでは登録できない' do
      # facrotybot.
      @user.email = 'invalidemail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字未満では登録できない' do
      # factory.bot
      @user.password = 'a1b2'
      @user.password_confirmation = 'a1b2'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字金剛以外では登録できない' do
      # facroty.bot
      @user.password = 'aaaaaa' # 例：英字のみ
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で6文字以上で入力してください')
    end
    it 'passwordが不一致の場合は登録できない' do
      # factory.bot
      @user.password = 'a1b2c3'
      @user.password_confirmation = 'd4e5f6'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dateが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birth_date = ''
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
