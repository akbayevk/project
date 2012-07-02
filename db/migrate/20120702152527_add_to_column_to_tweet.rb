class AddToColumnToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :to, :date
  end
end
