require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do

    it "is invalid without a text" do
      comment = build(:comment, text: "")
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      comment = build(:comment, user_id: "")
      comment.valid?
      expect(comment.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a item_id" do
      comment = build(:comment, item_id: "")
      comment.valid?
      expect(comment.errors[:item_id]).to include("can't be blank")
    end

  end
end