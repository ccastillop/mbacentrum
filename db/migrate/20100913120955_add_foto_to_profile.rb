class AddFotoToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :media_id, :integer
  end

  def self.down
    remove_column :profiles, :media_id
  end
end
