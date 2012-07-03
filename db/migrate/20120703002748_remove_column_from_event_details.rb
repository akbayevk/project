class RemoveColumnFromEventDetails < ActiveRecord::Migration
  def up
    remove_column :event_details, :marker_id
      end

  def down
    add_column :event_details, :marker_id, :string
  end
end
