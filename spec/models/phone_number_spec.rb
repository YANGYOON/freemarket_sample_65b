require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
    # 1. phone_numberが空では登録できないこと
    it "is invalid without a phone_number" do
      phone_number = build(:phone_number, phone_number: nil)
      phone_number.valid?
      expect(phone_number.errors[:phone_number]).to include("can't be blank")
    end

    # 2. 重複したphone_numberが存在する場合登録できないこと
    it "is invalid with a duplicate phone number" do
      phone_number = create(:phone_number)
      another_phone_number = build(:phone_number, phone_number: phone_number.phone_number)
      another_phone_number.valid?
      expect(another_phone_number.errors[:phone_number]).to include("has already been taken")
    end
  # end
end
