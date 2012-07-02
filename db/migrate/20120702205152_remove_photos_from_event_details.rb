class RemovePhotosFromEventDetails < ActiveRecord::Migration
  def up
    remove_column :event_details, :photos
      end

  def down
    add_column :event_details, :photos, :string
  end
end
