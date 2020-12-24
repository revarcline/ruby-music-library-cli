# Genre is a handsome middle boy. songs have one genre, artists have many
class Genre
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def artists
    songs.collect(&:artist).uniq
  end

  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).save
    self
  end
end
