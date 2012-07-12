class RemoveColumnCharacterIdFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :event_detail_id
      end

  def down
    add_column :events, :event_detail_id, :integer
  end
end
