# Genre is a handsome middle boy. songs have one genre, artists have many
class Genre
  attr_accessor :name, :song

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
