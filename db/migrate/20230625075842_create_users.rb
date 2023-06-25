class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :name
      t.string :surname
      t.string :avatar
      t.string :location
      t.string :about_me
      t.string :contact_info
      t.string :company
      t.string :position
      t.string :slug
      t.string :role
      t.boolean :activity_status
      t.boolean :is_rejected
      t.date :reject_date
      t.string :reject_reason
      t.boolean :is_banned
      t.date :ban_date
      t.string :ban_reason
      t.string :telegram_id
      t.string :respect

      t.timestamps
    end
  end
end
