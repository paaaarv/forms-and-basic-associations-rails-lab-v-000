require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_accessor :artist_name, :genre_name

  def artist_name=(name)
    @artist = Artist.find_or_create_by(name: name)
    self.artist = @artist
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end
end
