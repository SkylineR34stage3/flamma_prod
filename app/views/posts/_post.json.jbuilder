json.extract! post, :id, :title, :subtitle, :content, :slug, :last_activity, :post_type, :comment_count, :rating, :is_commentable, :is_visible, :is_draft, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
