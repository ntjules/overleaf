require "rails_helper"

RSpec.feature "Task_feature", type: :feature do
  background do
    # (1..10).each { |i|
    #   tasks = FactoryBot.create(:task, title: "title test #{i}", content: "content test #{i}", deadline: "2019-09-19 08:16:32")
    # }

    @task1 = FactoryBot.create(:task, title: "title test 1", content: "content test 1", deadline: "2019-09-19 08:16:32")
    @task2 = FactoryBot.create(:task, title: "title test 2", content: "content test 2", deadline: "2019-09-19 08:16:32")
    @task3 = FactoryBot.create(:task, title: "title test 3", content: "content test 3", deadline: "2019-09-19 08:16:32")
  end
  scenario "Test task list" do
    # Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")

    visit all_tasks_path
    # save_and_open_page

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
    # task = Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")
    visit all_tasks_path
    click_button("Show", match: :first)
    # visit task_path(@task)
    # save_and_open_page
    expect(page).to have_content "title test"
    expect(page).to have_content "content test"
  end

  scenario "task update" do
    # Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")

    visit all_tasks_path

    click_button("Edit", match: :first)

    fill_in "task_title", with: "title test updated"
    fill_in "task_content", with: "content test updated"
    fill_in "task_deadline", with: "2019-09-20 08:16:32"

    click_on "Update Task"

    expect(page).to have_content "title test updated"
    expect(page).to have_content "content test updated"
    expect(page).to have_content "September 20, 2019"
  end

  scenario "task delete" do
    # task = Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")

    visit all_tasks_path

    click_on("Delete", match: :first)
    # save_and_open_page
    expect(page).to have_content "Task was successfully destroyed"
  end

  scenario "Test for arrangement, creation_date desc" do
    visit all_tasks_path
    # save_and_open_page
    # expect(page).to have_content "title test11"
    # expect(page).to have_content "content test"
    # expect(page).to have_content "September 19, 2019"
    # expect(Task.order("created_at desc").each)

    expect(Task.all.recent).to eq [@task3, @task2, @task1]
  end
end
