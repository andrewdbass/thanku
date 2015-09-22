class AddPaperclipFilesToPerson < ActiveRecord::Migration
  def change
    add_column :people, :image_file_name, :string
    add_column :people, :image_content_type, :string
    add_column :people, :image_file_size, :integer
    add_column :people, :image_updated_at, :datetime
  end
end
