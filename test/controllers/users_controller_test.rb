require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { about_me: @user.about_me, activity_status: @user.activity_status, avatar: @user.avatar, ban_date: @user.ban_date, ban_reason: @user.ban_reason, company: @user.company, contact_info: @user.contact_info, email: @user.email, is_banned: @user.is_banned, is_rejected: @user.is_rejected, location: @user.location, name: @user.name, nickname: @user.nickname, position: @user.position, reject_date: @user.reject_date, reject_reason: @user.reject_reason, respect: @user.respect, role: @user.role, slug: @user.slug, surname: @user.surname, telegram_id: @user.telegram_id } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { about_me: @user.about_me, activity_status: @user.activity_status, avatar: @user.avatar, ban_date: @user.ban_date, ban_reason: @user.ban_reason, company: @user.company, contact_info: @user.contact_info, email: @user.email, is_banned: @user.is_banned, is_rejected: @user.is_rejected, location: @user.location, name: @user.name, nickname: @user.nickname, position: @user.position, reject_date: @user.reject_date, reject_reason: @user.reject_reason, respect: @user.respect, role: @user.role, slug: @user.slug, surname: @user.surname, telegram_id: @user.telegram_id } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
