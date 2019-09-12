class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :username, unique: true
      t.string :email, unique: true
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :password
      t.text   :image
      t.string :type
      
      t.timestamps
    end
  end
end
