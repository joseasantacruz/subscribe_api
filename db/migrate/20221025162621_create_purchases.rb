class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.float :sales_tax
      t.float :total

      t.timestamps
    end
  end
end
