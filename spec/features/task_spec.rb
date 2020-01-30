require "rails_helper"

RSpec.feature "Task_feature", type: :feature do
  background do
    # (1..10).each { |i|
    #   tasks = FactoryBot.create(:task, title: "title test #{i}", content: "content test #{i}", deadline: "2019-09-19 08:16:32")
    # }
    # create_user_and_log_in
    @task1 = FactoryBot.create(:task, title: "title test 1", content: "content test 1", deadline: "2019-09-19 08:16:32", priority: 1)
    @task2 = FactoryBot.create(:task, title: "title test 2", content: "content test 2", deadline: "2019-09-25 08:16:32", priority: 0)
    @task3 = FactoryBot.create(:task, title: "title test 3", content: "content test 3", deadline: "2019-09-20 08:16:32", priority: 2)
  end
  # scenario "Test task list" do
  #   create_user_and_log_in
  #   # Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")
  #   @task1 = FactoryBot.create(:task, title: "title test 1", content: "content test 1", deadline: "2019-09-19 08:16:32", priority: 1)

  #   visit all_tasks_path
  #   # save_and_open_page

  #   expect(page).to have_content "title test "
  #   expect(page).to have_content "content test"
  #   expect(page).to have_content "September 19, 2019"
  # end

  scenario "Test task creation and list task" do
    create_user_and_log_in
    visit new_task_path

    fill_in "task[title]", with: "title test"
    fill_in "task_content", with: "content test"
    fill_in "task_deadline", with: "2019-09-19 08:16:32"
    select "low", :from => "Priority"
    click_on "Create Task"

    expect(page).to have_content "title test"
    expect(page).to have_content "content test"
    expect(page).to have_content "September 19, 2019"
  end

  scenario "Test task details" do
    # task = Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")
    create_user_and_log_in
    visit new_task_path

    fill_in "task[title]", with: "title test"
    fill_in "task_content", with: "content test"
    fill_in "task_deadline", with: "2019-09-19 08:16:32"
    select "low", :from => "Priority"
    click_on "Create Task"

    visit all_tasks_path
    # save_and_open_page
    click_link("Show", match: :first)

    # click_button("Show", match: :first)
    # visit task_path(@task)
    expect(page).to have_content "title test"
    expect(page).to have_content "content test"
  end

  scenario "task update" do
    # Task.create!(title: "title test", content: "content test", deadline: "2019-09-19 08:16:32")

    create_user_and_log_in
    visit new_task_path

    fill_in "task[title]", with: "title test"
    fill_in "task_content", with: "content test"
    fill_in "task_deadline", with: "2019-09-19 08:16:32"
    select "low", :from => "Priority"
    click_on "Create Task"

    visit all_tasks_path

    # click_button("Edit", match: :first)
    click_link("Edit", match: :first)
    fill_in "task_title", with: "title test updated"
    fill_in "task_content", with: "content test updated"
    fill_in "task_deadline", with: "2019-09-20 08:16:32"

    click_on "Update Task"

    expect(page).to have_content "Task was successfully updated"
  end

  scenario "task delete" do
    create_user_and_log_in
    visit new_task_path

    fill_in "task[title]", with: "title test"
    fill_in "task_content", with: "content test"
    fill_in "task_deadline", with: "2019-09-19 08:16:32"
    select "low", :from => "Priority"
    click_on "Create Task"

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
  # scenario "Test for arrangement, deadline desc" do
  #   create_user_and_log_in
  #   visit all_tasks_path
  #   expect(page).to have_content "Taskawedr"
  #   # click_on("deadline desc", match: :first)

  #   # expect(Task.all.order(deadline: :desc)).to eq [@task2, @task3, @task1]
  # end
  # scenario "narrows results for a task using the search box by title and status" do
  #   visit all_tasks_path

  #   fill_in "q_title_or_status_cont", with: "test1"

  #   click_button "Search"

  #   expect(page).to have_text(@task1.title)
  # end

  # scenario "Test for sort by high priority" do
  #   visit all_tasks_path
  #   click_button("sort high priority")

  #   expect(Task.all.order(priority: :desc)).to eq [@task3, @task1, @task2]
  # end
end
