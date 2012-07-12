class RemoveColumnFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :character_id
      end

  def down
    add_column :events, :character_id, :integer
  end
end
