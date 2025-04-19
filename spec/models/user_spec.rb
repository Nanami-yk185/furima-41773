require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'emailが空では登録できない' do
      # テストコードを記述します
    end
    it 'emailが重複していると登録できない' do
      # テストコードを記述します
    end
    it 'emailは@なしでは登録できない' do
      # テストコードを記述します
    end
    it 'passwordが空では登録できない' do
      # テストコードを記述します
    end
    it 'passwordが6文字未満では登録できない' do
      # テストコードを記述します
    end
    it 'passwordが半角英数字金剛以外では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'passwordが不一致の場合は登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'last_nameが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'first_name空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'last_name_kanaが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'first_name_kanaが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'birth_dateが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
  end
end