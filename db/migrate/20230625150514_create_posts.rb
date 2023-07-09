class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.string :subtitle, null:false
      t.text :content, null:false
      t.string :slug, null: false
      t.datetime :last_activity, null: false
      t.string :post_type, null: false
      t.integer :comment_count, null: false
      t.integer :rating, null: false
      t.boolean :is_commentable, null: false
      t.boolean :is_visible, null: false
      t.boolean :is_draft, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
