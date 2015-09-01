class Artist
  # code here
  attr_accessor :name, :songs

  @@all = []

  def initialize
    Artist.all << self
    @songs = []
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
    self.all.select do |artist|
      artist.name == name
    end.first
  end

  def self.create_by_name(name)
    artist = Artist.new
    artist.name = name
    artist
  end

  def genres
    self.songs.map do |song|
      song.genre
    end
  end

  def add_song(song)
    self.songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each do |song|
      self.songs << song
    end
  end
end