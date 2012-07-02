class AddTweetIdNameToEventDetail < ActiveRecord::Migration
  def change
    add_column :event_details, :tweet_id, :string
  end
end
