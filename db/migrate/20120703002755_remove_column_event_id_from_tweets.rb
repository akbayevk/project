class RemoveColumnEventIdFromTweets < ActiveRecord::Migration
  def up
    remove_column :tweets, :event_id
      end

  def down
    add_column :tweets, :event_id, :string
  end
end
