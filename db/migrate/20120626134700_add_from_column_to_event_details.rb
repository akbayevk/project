class AddFromColumnToEventDetails < ActiveRecord::Migration
  def change
    add_column :event_details, :from, :date
  end
end
