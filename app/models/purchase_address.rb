class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number,:user_id,:item_id 

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :house_number
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, numericality: { only_integer: true }, length: {maximum: 11}
  
  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end