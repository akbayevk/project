class RemoveColumnFromTweets < ActiveRecord::Migration
  def up
    remove_column :tweets, :to
      end

  def down
    add_column :tweets, :to, :string
  end
end
