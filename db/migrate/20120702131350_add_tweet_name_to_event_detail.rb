class AddTweetNameToEventDetail < ActiveRecord::Migration
  def change
    add_column :event_details, :tweet_name, :string
  end
end
