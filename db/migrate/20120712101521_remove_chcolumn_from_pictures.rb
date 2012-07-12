class RemoveChcolumnFromPictures < ActiveRecord::Migration
  def up
    remove_column :pictures, :character_id
      end

  def down
    add_column :pictures, :character_id, :integer
  end
end
