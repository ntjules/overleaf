require "rails_helper"

RSpec.describe "Task_model", type: :model do
  it "Validation does not pass if the title is empty" do
    task = Task.new(title: "", content: "content test", deadline: "2019-09-19 08:16:32")
    expect(task).not_to be_valid
  end

  it "Validation does not pass if content is empty" do
    task = Task.new(title: "title", content: "", deadline: "2019-09-19 08:16:32")
    expect(task).not_to be_valid
  end

  it "Validation does not pass if deadline is empty" do
    task = Task.new(title: "title", content: "content test", deadline: "")
    expect(task).not_to be_valid
  end

  it "validation passes If content is described in title and content" do
    task = Task.new(title: "valid title", content: "valid content", deadline: "2019-09-19 08:16:32")
    expect(task).to be_valid
  end
end
