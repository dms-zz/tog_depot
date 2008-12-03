class CreateFiles < ActiveRecord::Migration
  def self.up
    create_table :files do |t|
      t.string  :title
      t.text    :description
      t.integer :user_id
			t.string  :filename
			t.integer :size
			t.string  :state
			t.integer :filefolder_id
			t.integer :num_download

      t.timestamps
    end
  end

  def self.down
    drop_table :files
  end
end
