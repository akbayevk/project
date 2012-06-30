class CreateEventDetails < ActiveRecord::Migration
  def change
    create_table :event_details do |t|
      t.integer :marker_id
      t.string :title
      t.string :description
      t.string :tweets
      t.string :videos
      t.string :photos
      t.string :blogs

      t.timestamps
    end
  end
end
