class RenameUserToFiles < ActiveRecord::Migration
  def self.up
    rename_column :files, :author_id, :user_id
  end

  def self.down
  end
end
