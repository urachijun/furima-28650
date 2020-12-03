class Item < ApplicationRecord
belongs_to :user
has_one_attached :image
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_day

end
