# Genre is a handsome middle boy. songs have one genre, artists have many
class Genre
  extend Concerns::Findable
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

  def save
    self.class.all << self
    self
  end

  def self.create(name)
    new(name).save
  end
end
