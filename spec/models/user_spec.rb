require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailが@を含まない形だと登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'ab12'
      @user.password_confirmation = 'ab12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが英字のみでは登録できない' do
      @user.password = 'qwerty'
      @user.password_confirmation = 'qwerty'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
    end

    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
    end

    it 'passwordに全角文字が含まれていると登録できない' do
      @user.password = 'ａｂｃ１２３' 
      @user.password_confirmation = 'ａｂｃ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
    end

    it 'passwordとpassword_confirmationが一致してないと登録できない' do
      @user.password = 'abc123'
      @user.password_confirmation = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '姓が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it '名が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '姓(カナ)が空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it '名(カナ)が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '姓(カナ)がカタカナ以外だと登録できない' do
      @user.family_name_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it '名(カナ)がカタカナ以外だと登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it '姓が全角以外だと登録できない' do
      @user.family_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name は全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it '名が全角以外だとだと登録できない' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it '生年月日が空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
