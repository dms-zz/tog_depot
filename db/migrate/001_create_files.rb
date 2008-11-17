class CreateFiles < ActiveRecord::Migration
  def self.up
    create_table :files do |t|
      t.string  :title
      t.text    :description
      t.integer :author_id

      t.timestamps
    end
  end

  def self.down
    drop_table :files
  end
end
