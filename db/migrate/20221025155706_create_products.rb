class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :is_imported
      t.integer :tax

      t.timestamps
    end
  end
end
