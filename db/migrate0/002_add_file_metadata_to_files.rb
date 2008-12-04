class AddFileMetadataToFiles < ActiveRecord::Migration
  def self.up
    add_column :files, :filename, :string
    add_column :files, :size, :integer
  end

  def self.down
    remove_column :files, :filename, :string
    remove_column :files, :size, :integer
  end
end

