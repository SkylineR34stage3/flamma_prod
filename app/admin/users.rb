ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :nickname, :name, :surname, :role, :status

  index do
    selectable_column
    id_column
    column :email
    column :nickname
    column :name
    column :surname
    column :role
    column :status
    actions
  end

  filter :email
  filter :nickname
  filter :name
  filter :surname
  filter :role
  filter :status

  form do |f|
    f.inputs do
      f.input :email
      f.input :nickname
      f.input :name
      f.input :surname
      f.input :role, as: :select, collection: User.roles.keys
      f.input :status, as: :select, collection: User.statuses.keys
    end
    f.actions
  end
end
