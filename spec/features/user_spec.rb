require "rails_helper"

RSpec.feature "User", type: :feature do
  scenario "login" do
    create_user_and_log_in
    expect(page).to have_content "Logout"
  end
end

RSpec.feature "User_admin", type: :feature do
  scenario "create user" do
    create_user_and_log_in

    click_on "Admin page"
    click_on "New user"

    fill_in "user_first_name", with: "createdname"
    fill_in "user_last_name", with: "lname"
    fill_in "user_email", with: "test@dic.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"

    click_on "Create"

    # expect(page).to have_content "User was successfully created"
  end

  scenario "list users" do
    create_user_and_log_in
    visit admin_users_path
    expect(page).to have_content "user@test.com"
  end

  scenario "update user" do
    create_user_and_log_in
    User.create!(first_name: "name1", last_name: "lastname2", email: "email2@email.com", password: "123654")
    visit admin_users_path
    click_on("Edit", match: :first)

    fill_in "user_first_name", with: "nameupdated"
    fill_in "user_last_name", with: "lname"
    fill_in "user_email", with: "test@dic.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"

    click_button "Create"
    # expect(page).to have_content "user was successfully updated"
  end

  # scenario "delete user" do
  #   create_user_and_log_in
  #   User.create!(first_name: "name1", last_name: "lastname2", email: "email2@email.com", password: "123654")
  #   visit admin_users_path
  #   click_on("Delete", match: :first)
  #   expect(page).to have_content "User was successfully destroyed"
  # end
end
