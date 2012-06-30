class AddToColumnToEventDetails < ActiveRecord::Migration
  def change
    add_column :event_details, :to, :date
  end
end
