class RenameFilefolderIdToFiles < ActiveRecord::Migration
  def self.up
    rename_column :files, :files_folder_id, :filefolder_id
  end

  def self.down
    rename_column :files, :filefolder_id, :files_folder_id
  end
end

