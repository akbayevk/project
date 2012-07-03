class AddColumnToEventDetails < ActiveRecord::Migration
  def change
    add_column :event_details, :character_id, :integer
  end
end
