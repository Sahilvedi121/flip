class CreateDeliveryDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_details do |t|
      t.references :order, null: false, foreign_key: true
      t.string :address
      t.timestamps
    end
  end
end
