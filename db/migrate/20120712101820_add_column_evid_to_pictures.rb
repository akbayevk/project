class AddColumnEvidToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :event_detail_id, :integer
  end
end
