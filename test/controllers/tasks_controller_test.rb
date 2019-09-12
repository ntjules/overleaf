require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get tasks" do
    get tasks_tasks_url
    assert_response :success
  end

end
