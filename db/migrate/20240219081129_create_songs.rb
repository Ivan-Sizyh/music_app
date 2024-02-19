class CreateSongs < ActiveRecord::Migration[7.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :length
      t.integer :filesize
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
