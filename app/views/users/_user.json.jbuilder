json.extract! user, :id, :nickname, :email, :name, :surname, :avatar, :location, :about_me, :contact_info, :company, :position, :slug, :role, :activity_status, :is_rejected, :reject_date, :reject_reason, :is_banned, :ban_date, :ban_reason, :telegram_id, :respect, :created_at, :updated_at
json.url user_url(user, format: :json)
