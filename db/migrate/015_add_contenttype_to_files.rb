class AddContenttypeToFiles < ActiveRecord::Migration
  def self.up
    add_column :files, :content_type, :string
  end

  def self.down
    remove_column :files, :content_type
  end
end


