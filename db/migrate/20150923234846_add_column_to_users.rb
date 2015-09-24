class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sessions, :integer
  end
end
