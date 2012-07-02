class RemoveBlogsFromEventDetails < ActiveRecord::Migration
  def up
    remove_column :event_details, :blogs
      end

  def down
    add_column :event_details, :blogs, :string
  end
end
