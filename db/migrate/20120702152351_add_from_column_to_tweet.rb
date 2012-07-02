class AddFromColumnToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :from, :date
  end
end
