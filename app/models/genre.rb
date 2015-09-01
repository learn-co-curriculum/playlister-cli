class Genre
  attr_accessor :name, :songs 

  @@all = []

  def initialize
    Genre.all << self
    @songs = []
  end

  def artists
    self.songs.map do |song|
      song.artist
    end.uniq
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.select do |genre|
      genre.name == name
    end.first
  end

  def self.create_by_name(name)
    genre = Genre.new
    genre.name = name
    genre
  end
end