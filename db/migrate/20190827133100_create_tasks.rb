class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.datetime :deadline
      t.string :title
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
