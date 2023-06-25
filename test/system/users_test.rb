require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "About me", with: @user.about_me
    check "Activity status" if @user.activity_status
    fill_in "Avatar", with: @user.avatar
    fill_in "Ban date", with: @user.ban_date
    fill_in "Ban reason", with: @user.ban_reason
    fill_in "Company", with: @user.company
    fill_in "Contact info", with: @user.contact_info
    fill_in "Email", with: @user.email
    check "Is banned" if @user.is_banned
    check "Is rejected" if @user.is_rejected
    fill_in "Location", with: @user.location
    fill_in "Name", with: @user.name
    fill_in "Nickname", with: @user.nickname
    fill_in "Position", with: @user.position
    fill_in "Reject date", with: @user.reject_date
    fill_in "Reject reason", with: @user.reject_reason
    fill_in "Respect", with: @user.respect
    fill_in "Role", with: @user.role
    fill_in "Slug", with: @user.slug
    fill_in "Surname", with: @user.surname
    fill_in "Telegram", with: @user.telegram_id
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "About me", with: @user.about_me
    check "Activity status" if @user.activity_status
    fill_in "Avatar", with: @user.avatar
    fill_in "Ban date", with: @user.ban_date
    fill_in "Ban reason", with: @user.ban_reason
    fill_in "Company", with: @user.company
    fill_in "Contact info", with: @user.contact_info
    fill_in "Email", with: @user.email
    check "Is banned" if @user.is_banned
    check "Is rejected" if @user.is_rejected
    fill_in "Location", with: @user.location
    fill_in "Name", with: @user.name
    fill_in "Nickname", with: @user.nickname
    fill_in "Position", with: @user.position
    fill_in "Reject date", with: @user.reject_date
    fill_in "Reject reason", with: @user.reject_reason
    fill_in "Respect", with: @user.respect
    fill_in "Role", with: @user.role
    fill_in "Slug", with: @user.slug
    fill_in "Surname", with: @user.surname
    fill_in "Telegram", with: @user.telegram_id
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
