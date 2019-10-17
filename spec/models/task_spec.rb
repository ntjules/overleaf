require "rails_helper"

RSpec.describe "Task_model", type: :model do
  context "validation" do
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

  context "scopes" do
    before(:all) do
      @task1 = FactoryBot.create(:task, title: "test", content: "content test 1", deadline: "2019-09-19 08:16:32")
      @task2 = FactoryBot.create(:task, title: "title2 ", content: "content test 2", deadline: "2019-09-25 08:16:32")
    end

    it "should only return title searched" do
      # Task.title_like("tit").should == [@task2]
      expect(Task.title_like("tit")).to eq [@task2]
    end
  end
end
