class AddStateToFilesFolder < ActiveRecord::Migration
  def self.up
    add_column :files_folder, :state, :string
  end

  def self.down
    remove_column :files_folder, :string
  end
end
