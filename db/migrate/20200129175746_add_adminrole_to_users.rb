class AddAdminroleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :adminrole, :boolean, default: false
  end
end
