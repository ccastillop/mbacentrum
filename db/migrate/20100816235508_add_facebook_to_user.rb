class AddFacebookToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_uid, :string
    add_column :users, :facebook_token, :string
  end

  def self.down
    remove_column :users, :facebook_token
    remove_column :users, :facebook_uid
  end
end
