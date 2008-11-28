class RenameFilesFolderIdToFiles < ActiveRecord::Migration
  def self.up
    rename_column :files, :folderfile_id, :files_folder_id
  end

  def self.down
    rename_column :files, :files_folder_id, :folderfile_id
  end
end

