require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいく時' do
      it '全ての項目が入っていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品登録がうまく行かない時' do
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'Descriptionmが空では登録できない' do
        @item.descriptionm = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Descriptionm can't be blank"
      end
      it 'categoryが０だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 0'
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'Stateが０だと登録できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'State must be other than 0'
      end
      it 'Shipping fee burdenが０だと登録できない' do
        @item.shipping_fee_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee burden must be other than 0'
      end
      it 'Prefecture が０だと登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
      end
      it 'Shipping day が０だと登録できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping day must be other than 0'
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが数字以外では登録できない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end
