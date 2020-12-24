# Artist has many songs and genres, can add_song
class Artist
  attr_accessor :name, :song, :genre

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).save
    self
  end
end
