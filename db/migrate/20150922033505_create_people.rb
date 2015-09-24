class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :bio
      t.string :link
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
