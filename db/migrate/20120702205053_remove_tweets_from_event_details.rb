class RemoveTweetsFromEventDetails < ActiveRecord::Migration
  def up
    remove_column :event_details, :tweets
      end

  def down
    add_column :event_details, :tweets, :string
  end
end
