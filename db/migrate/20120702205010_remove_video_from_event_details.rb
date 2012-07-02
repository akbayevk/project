class RemoveVideoFromEventDetails < ActiveRecord::Migration
  def up
    remove_column :event_details, :videos
      end

  def down
    add_column :event_details, :videos, :string
  end
end
