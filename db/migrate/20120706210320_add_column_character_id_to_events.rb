class AddColumnCharacterIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :character_id, :integer
  end
end
