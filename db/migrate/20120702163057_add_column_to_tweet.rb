class AddColumnToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_created_date, :date
  end
end
