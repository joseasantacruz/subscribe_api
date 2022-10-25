class CreatePurchaseDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_details do |t|
      t.integer :count
      t.float :price
      t.belongs_to :purchase, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
