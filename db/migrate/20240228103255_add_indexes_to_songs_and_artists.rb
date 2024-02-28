class AddIndexesToSongsAndArtists < ActiveRecord::Migration[7.2]
  def change
    add_index :songs, :created_at
    add_index :artists, :name
  end
end
