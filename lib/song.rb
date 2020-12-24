# Song belongs to artist, can init with artist, have one genre
class Song
  attr_accessor :name, :artist, :genre

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
