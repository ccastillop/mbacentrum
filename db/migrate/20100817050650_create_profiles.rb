class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :gender
      t.string :email
      t.string :telephones
      t.string :about
      t.integer :mba_id
      t.integer :work_id
      t.string :title
      t.integer :function_id
      t.integer :level_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
