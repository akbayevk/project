class AddColumnEventDetailIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :event_detail_id, :integer
  end
end
