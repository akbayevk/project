class RemoveColumnsFromEventDetails < ActiveRecord::Migration
  def up
    remove_column :event_details, :tweet_id
        remove_column :event_details, :tweet_name
        remove_column :event_details, :tweet_content
      end

  def down
    add_column :event_details, :tweet_content, :string
    add_column :event_details, :tweet_name, :string
    add_column :event_details, :tweet_id, :string
  end
end
