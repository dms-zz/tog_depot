class CreateFilesFolder < ActiveRecord::Migration
  def self.up
    create_table :files_folder do |t|
      t.string  :title
      t.text    :description
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :files_folder
  end
end
