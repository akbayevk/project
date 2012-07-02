class AddTweetContentNameToEventDetail < ActiveRecord::Migration
  def change
    add_column :event_details, :tweet_content, :text
  end
end
