class LibraryParser

 def call
  files.each do |file|
    build_song(file)
  end
 end

  def files
    @files = Dir['db/data/*']
  end

  def parse_filename(filename)
  
    # at this point a file name looks something like this: 
    # "db/data/Action Bronson - Larry Csonka [indie].mp3"
    # the line below slices off the db/data/ that prepends each file name
  
    filename.slice!(0..7)
    # binding.pry

    # the below regular expressions, given as arguments ot the .match method, will return the section of filename that we want
    artist = filename.match(/^(.*) -/)[1]
    song   = filename.match(/- (.*) \[/)[1]
    genre  = filename.match(/\[([^\]]*)\]/)[1]

    # return the array of the artist's name, song's name and genre's name
    [artist, song, genre]
  end

  def build_song(filename)

    file_array = parse_filename(filename)
  
    song = Song.create_by_name(file_array[1])
    artist = Artist.create_by_name(file_array[0])
    genre = Genre.create_by_name(file_array[2])
    
    artist.add_song(song)
    song.genre = genre
    
    song
  end


end