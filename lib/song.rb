# Song belongs to artist, can init with artist, have one genre
class Song
  attr_accessor :artist, :genre

  def initialize(attributes)
    attributes.each { |key, value| send("#{key}=", value) }
  end
end
