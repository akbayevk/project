class AddColumnEdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_detail_id, :integer
  end
end
