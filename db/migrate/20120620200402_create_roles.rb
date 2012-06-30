class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user
      t.string :role

      t.timestamps
    end
  end
end
