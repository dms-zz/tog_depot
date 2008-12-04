class AddStateToFile < ActiveRecord::Migration
  def self.up
    add_column :files, :state, :string
  end

  def self.down
    remove_column :files, :state
  end
end
