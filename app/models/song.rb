class Song
  # code here

  attr_accessor :name, :artist
  attr_reader :genre

  @@all = []

  def initialize
    self.class.all << self
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

  def genre=(genre_item)
    @genre = genre_item
    genre_item.songs << self
  end

  def self.find_by_name(name)
    self.all.select do |song|
      song.name == name
    end.first
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def to_s
   "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end
end