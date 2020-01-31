require "rails_helper"

RSpec.feature "User", type: :feature do
  scenario "login" do
    create_user_and_log_in
    expect(page).to have_content "Logout"
  end
end
