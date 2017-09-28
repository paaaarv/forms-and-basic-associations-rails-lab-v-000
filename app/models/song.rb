class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :artist_name, :genre_name

  def artist_name=(name)
    @artist = Artist.find_or_create_by(name: name)
    self.artist = @artist
  end

  def genre_name=(ids)
    if !ids.empty?
      ids.each do |id|
        genre = Genre.find(id)
        self.genres << genre
      end
    end
  end
end
