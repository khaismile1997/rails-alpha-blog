class AddIndexTableUser < ActiveRecord::Migration[6.1]
  def up
    add_index :users, :username, :unique => true, :name => 'user_username_index'
    add_index :users, :email, :unique => true, :name => 'user_email_index'
  end
end
