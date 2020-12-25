# Song belongs to artist, can init with artist, have one genre
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(query)
    all.find { |song| song.name == query }
  end

  def self.find_or_create_by_name(query)
    find_by_name(query) || create(query)
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
    self
  end

  def self.create(name)
    new(name).save
  end

  def self.new_from_filename(filename)
    names = filename.split(' - ')
    a = names[0]
    s = names[1]
    g = names[2].gsub('.mp3', '')

    artist = Artist.find_or_create_by_name(a)
    genre = Genre.find_or_create_by_name(g)

    new(s, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end
