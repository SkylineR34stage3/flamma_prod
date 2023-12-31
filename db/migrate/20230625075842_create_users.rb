class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :surname, null: false, default: ""
      t.string :location
      t.text :about_me, null: false, default: ""
      t.string :contact_info
      t.string :company
      t.string :position
      t.string :slug
      t.integer :role, default: 0 # set default role as "user"
      t.integer :status, default: 0 # set default status as "pending_verification"
      t.boolean :activity_status, default: false
      t.boolean :is_rejected, default: false
      t.date :reject_date
      t.string :reject_reason
      t.boolean :is_banned, default: false
      t.datetime :ban_date
      t.string :ban_reason
      t.integer :respect, default: 0

      t.timestamps
    end

    # adding indices for fields that you may query frequently
    add_index :users, :email, unique: true
    add_index :users, :slug, unique: true
    add_index :users, :role
    add_index :users, :status
  end
end
