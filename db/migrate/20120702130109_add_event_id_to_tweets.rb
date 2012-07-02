class AddEventIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :event_id, :string
  end
end
