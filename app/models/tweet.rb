class Tweet < ActiveRecord::Base
  attr_accessible :content, :screen_name, :event_detail_id,  :tweet_created_date, :tweet_id
  belongs_to :event_detail
  
  def self.set_tweets(name, event_id)
    Twitter.user_timeline(name).each do |tweet|
      unless exists?(tweet_id: tweet.id)
        create!(
        tweet_id: tweet.id,
        content: tweet.text,
        screen_name: tweet.user.screen_name,
        tweet_created_date: tweet.created_at,
        event_detail_id: event_id
        )
      end
    end
  end
  
  def Tweet.delete_bad_records(id, from,to)
    tweets = Tweet.find_all_by_event_detail_id (id)
    if tweets.empty?
    else
      tweets.each do |t|
        if (t.tweet_created_date < from || t.tweet_created_date > to)
          t.destroy
        end
      end

  end
end
end