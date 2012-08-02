class Changecolumnnameofrole < ActiveRecord::Migration
  def self.up
    rename_column :roles, :role, :name
  end

  def down
  end
end
