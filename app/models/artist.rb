class Artist < ApplicationRecord
  has_many :songs, -> { order(title: :asc) }

  def songs_top
    unsorted_songs.left_outer_joins(:downloads)
                  .group(:id)
                  .select("songs.id, songs.title, COUNT(downloads.id) AS downloads_count")
                  .order(downloads_count: :desc)
  end

  def self.top(letter, count)
    where("name LIKE ? OR name LIKE ?", "#{letter}%", "#{letter.downcase!}%")
      .left_outer_joins(songs: :downloads)
      .group(:id)
      .select("artists.*, COUNT(downloads.id) AS downloads_count")
      .order(downloads_count: :desc)
      .limit(count)
  end

  private

  def unsorted_songs
    songs.reorder(nil)
  end
end
