class Product < ApplicationRecord
  has_many :purchase_details, inverse_of: :product, class_name: 'PurchaseDetail'
end
