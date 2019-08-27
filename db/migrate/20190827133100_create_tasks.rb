class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|

      t.datetime :deadline
      t.string   :task_title
      t.text     :task_content
      t.string   :task_status

      t.timestamps
    end
  end
end
