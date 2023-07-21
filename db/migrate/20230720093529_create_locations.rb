class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country

      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end