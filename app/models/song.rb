class Song < ApplicationRecord
  belongs_to :artist

  has_many :downloads

  def self.top(days, count)
    where("songs.created_at >= ?", days.days.ago)
      .left_outer_joins(:downloads)
      .group(:id)
      .select("songs.*, COUNT(downloads.id) AS downloads_count")
      .order("downloads_count DESC")
      .limit(count)
  end
end
