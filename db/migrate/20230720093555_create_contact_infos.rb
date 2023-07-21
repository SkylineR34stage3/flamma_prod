class CreateContactInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_infos do |t|
      t.string :telegram_id
      t.string :phone

      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end