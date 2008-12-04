class AddFolderToFile < ActiveRecord::Migration
  def self.up
    add_column :files, :folderfile_id, :integer
		add_column :files, :num_download, :integer
  end

  def self.down
    remove_column :files, :folderfile_id
    remove_column :files, :num_download
  end
end
