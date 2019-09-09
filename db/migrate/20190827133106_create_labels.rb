class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|

      t.string   :label
      t.integer  :user_id

      t.timestamps
    end
  end
end
