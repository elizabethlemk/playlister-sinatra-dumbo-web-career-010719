class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug(string)
    slug = string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
