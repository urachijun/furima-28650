class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture,:city,:house_number,:building_name,:phone_number,:token,:user_id,:item_id 

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, numericality: { only_integer: true }, length: {maximum: 11}
  
  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Parchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end