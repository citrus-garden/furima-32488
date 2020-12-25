require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー管理機能" do
    before do
      @user = FactoryBot.build(:user)
    end

    context "新規登録できる場合" do
      it "値が全て正しく存在していれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できない場合" do
      it "nicknameが空だと登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@が含まれていないと登録できないこと" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在すると登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")      
      end

      it "passwordが空だと登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下だと登録できないこと" do
        @user.password = "1a1a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end

      it "passwordが英字のみだと登録できないこと" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it "passwordが数字のみだと登録できないこと" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it "passwordに全角文字が含まれていると登録でいないこと" do
        @user.password = "１ａ１ａ１ａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it "password_confirmationが空だと登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordとpassword_confirmationが一致しないと登録できないこと" do
        @user.password = "1a1a1a1"
        @user.password_confirmation = "a1a1a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameが空だと登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end

      it "last_nameが日本語以外だと登録できないこと" do
        @user.last_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_nameが空だと登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end

      it "first_nameに日本語以外が含まれていると登録できないこと" do
        @user.first_name = "たろu"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_name_kanaが空だと登録できないこと" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end

      it "last_name_kanaにカタカナ以外が含まれていると登録できないこと" do
        @user.last_name_kana = "ヤマ田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "first_name_kanaが空だと登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end

      it "first_name_kanaにカタカナ以外が含まれていると登録できないこと" do
        @user.first_name_kana = "太ロウ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "birthdayが空だと登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
