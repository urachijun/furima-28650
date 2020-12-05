class Item < ApplicationRecord
belongs_to :user
has_one_attached :image
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :name, :descriptionm, :price, :image
    validates :category_id, :state_id, :shipping_fee_burden_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 0 }
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 }
  end

end
