# Artist has many songs and genres, can add_song
class Artist
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

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect(&:genre).uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).save
    self
  end
end
