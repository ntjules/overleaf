require "rails_helper"

RSpec.feature "Tasks", type: :feature do
  scenario "Test task list" do
    Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")

    visit all_tasks_path

    expect(page).to have_content "title test"
    expect(page).to have_content "content test"
    expect(page).to have_content "September 19, 2019"
  end

  scenario "Test task creation" do
    visit new_task_path

    fill_in "task_title", with: "title test"
    fill_in "task_content", with: "content test"
    fill_in "task_deadline", with: "2019-09-19 08:16:32"
    click_on "Create Task"

    expect(page).to have_content "title test"
    expect(page).to have_content "content test"
    expect(page).to have_content "September 19, 2019"
  end

  scenario "Test task details" do
    task = Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")

    visit task_path(task)

    expect(page).to have_content "title test"
    expect(page).to have_content "content test"
  end

  scenario "task update" do
    Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")

    visit all_tasks_path

    click_on "Edit"

    fill_in "task_title", with: "title test updated"
    fill_in "task_content", with: "content test updated"
    fill_in "task_deadline", with: "2019-09-20 08:16:32"

    click_on "Update Task"

    expect(page).to have_content "title test updated"
    expect(page).to have_content "content test updated"
    expect(page).to have_content "September 20, 2019"
  end

  scenario "task delete" do
    task = Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")

    visit all_tasks_path

    click_on "Delete"
    # save_and_open_page
    expect(page).to have_content "Task was successfully destroyed"
  end
end
