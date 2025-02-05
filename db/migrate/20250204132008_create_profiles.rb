class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :contact_no
      t.integer :age
      t.string :gender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
