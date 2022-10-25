class Purchase < ApplicationRecord
  has_many :purchase_details, inverse_of: :purchase, class_name: 'PurchaseDetail'
end
