class ChangeColumnSessionsUsers < ActiveRecord::Migration
  def change
  	change_column :users, :sessions, :integer, :default => 0
  end
end
