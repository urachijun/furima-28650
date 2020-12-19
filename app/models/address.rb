class Address < ApplicationRecord
  belongs_to :purchases
  belongs_to_active_hush :prefecture
end
