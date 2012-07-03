class RemoveColumnTweetIdFromTweets < ActiveRecord::Migration
  def up
    remove_column :tweets, :tweet_id
      end

  def down
    add_column :tweets, :tweet_id, :string
  end
end
