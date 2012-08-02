class RemoveUserColumnFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :user
      end

  def down
    add_column :roles, :user, :integer
  end
end
