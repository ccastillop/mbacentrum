class CreateMbas < ActiveRecord::Migration
  def self.up
    create_table :mbas do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :mbas
  end
end
