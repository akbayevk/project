class ChangeDataTypeForDesciptionFromEventDetailsFromStringToText < ActiveRecord::Migration
  def up
   
    change_table :event_details do |t|
      t.change :description, :text
   
  end
  end

  def down
    change_table :event_details do |t|
      t.change :description, :string
    end
  end
end
