class Tweet < ActiveRecord::Base
  attr_accessible :content, :screen_name, :event_detail_id,  :tweet_created_date, :tweet_id
  belongs_to :event_detail
  
  def self.set_tweets(name)
    Twitter.user_timeline(name).each do |tweet|
      unless exists?(tweet_id: tweet.id)
        create!(
        tweet_id: tweet.id,
        content: tweet.text,
        screen_name: tweet.user.screen_name,
        tweet_created_date: tweet.created_at
        )
      end
    end
  end
  
  def self.update_tweets(id, name, from, to)
    
    tweets = Tweet.find_all_by_screen_name(name, :conditions =>["date(created_at) BETWEEN ? AND ? ", from ,to])
     for i in tweets do
       i.event_detail_id = id
 end 
      
  end
end
