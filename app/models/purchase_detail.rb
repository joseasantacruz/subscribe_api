class PurchaseDetail < ApplicationRecord
  belongs_to :purchase, inverse_of: :purchase_details, class_name: 'Purchase'
  belongs_to :product, inverse_of: :purchase_details, class_name: 'Product'
end
