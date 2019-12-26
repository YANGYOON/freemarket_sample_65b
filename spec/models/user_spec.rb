# require 'rails_helper'

# RSpec.describe User, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"
#   describe '#create' do
    
#     # 1. nicknameとemail、passwordが存在すれば登録できること
#     it "is valid with a nickname, email, password," do
#       user = build(:user)
#       expect(user).to be_valid
#     end

#     # 2. nicknameが空では登録できないこと
#     it "is invalid without a nickname" do
#       user = build(:user, nickname: nil)
#       user.valid?
#       expect(user.errors[:nickname]).to include("can't be blank")
#     end

#     # 3. emailが空では登録できないこと
#     it "is invalid without a email" do
#       user = build(:user, email: nil)
#       user.valid?
#       expect(user.errors[:email]).to include("can't be blank")
#     end

#     # 4. passwordが空では登録できないこと
#     it "is invalid without a password" do
#       user = build(:user, password: nil)
#       user.valid?
#       expect(user.errors[:password]).to include("can't be blank")
#     end

#     it "is invalid with a duplicate nickname" do
#       user = create(:user)
#       another_user = build(:user, nickname: user.nickname)
#       another_user.valid?
#       expect(another_user.errors[:nickname]).to include("has already been taken")
#     end

#     # 5. 重複したemailが存在する場合登録できないこと
#     it "is invalid with a duplicate email address" do
#       user = create(:user)
#       another_user = build(:user, email: user.email)
#       another_user.valid?
#       expect(another_user.errors[:email]).to include("has already been taken")
#     end

    
#     # 6. passwordが7文字以上であれば登録できること
#     it "is valid with a password that has more than 7 characters " do
#       user = build(:user, password: "0000000")
#       user.valid?
#       expect(user).to be_valid
#     end

#     # 7. passwordが6文字以下であれば登録できないこと
#     it "is invalid with a password that has less than 6 characters " do
#       user = build(:user, password: "000000")
#       user.valid?
#       expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
#     end

#   end
# end

    # # 1. optionalデータ以外が存在すれば登録できること
    # it "is valid with data except for optionals," do
    #   user_profile = build(:user_profile)
    #   expect(user_profile).to be_valid
    # end

    # # 2. last_nameが空では登録できないこと
    # it "is invalid without a lastname" do
    #   user_profile = build(:user_profile, last_name: nil)
    #   user_profile.valid?
    #   expect(user_profile.errors[:last_name]).to include("can't be blank")
    # end

    # # 3. first_nameが空では登録できないこと
    # it "is invalid without a first_name" do
    #   user_profile = build(:user_profile, first_name: nil)
    #   user_profile.valid?
    #   expect(user_profile.errors[:first_name]).to include("can't be blank")
    # end

    # # 4. last_name_kanaが空では登録できないこと
    # it "is invalid without a last_name_kana" do
    #   user_profile = build(:user_profile, last_name_kana: nil)
    #   user_profile.valid?
    #   expect(user_profile.errors[:last_name_kana]).to include("can't be blank")
    # end

    # # 5. first_name_kanaが空では登録できないこと
    # it "is invalid without a first_name_kana" do
    #   user_profile = build(:user_profile, first_name_kana: nil)
    #   user_profile.valid?
    #   expect(user_profile.errors[:first_name_kana]).to include("can't be blank")
    # end

    # # 6. birth_yearが空では登録できないこと
    # it "is invalid without a birth_year" do
    #   user_profile = build(:user_profile, birth_year: nil)
    #   user_profile.valid?
    #   expect(user_profile.errors[:birth_year]).to include("can't be blank")
    # end
    
    # # 7. birth_monthが空では登録できないこと
    # it "is invalid without a brith_month" do
    #   user_profile = build(:user_profile, birth_month: nil)
    #   user_profile.valid?
    #   expect(user_profile.errors[:birth_month]).to include("can't be blank")
    # end

    # # 8. birth_dayが空では登録できないこと
    # it "is invalid without a birth_day" do
    #   user_profile = build(:user_profile, birth_day: nil)
    #   user_profile.valid?
    #   expect(user_profile.errors[:birth_day]).to include("can't be blank")
    # end

    # # 9. phone_numberが空では登録できないこと
    # it "is invalid without a nickname" do
    #   user_profile = build(:user_profile, phone_number: nil)
    #   user_profile.valid?
    #   expect(user_profile.errors[:phone_number]).to include("can't be blank")
    # end

    # # 10. 重複したphone_numberが存在する場合登録できないこと
    # it "is invalid with a duplicate phone number" do
    #   user_profile = create(:user_profile)
    #   another_user_profile = build(:user_profile, phone_number: user_profile.phone_number)
    #   another_user_profile.valid?
    #   # binding.pry
    #   expect(another_user_profile.errors[:phone_number]).to include("has already been taken")
    # end
