class LibraryParser

 def call
<<<<<<< HEAD
  files.each do |file|
    build_song(file)
  end
=======
  # code here
>>>>>>> a1697bd8d427eca88fbf46f9a1610fa700841667
 end

  def files
    @files = Dir['db/data/*']
  end

  def parse_filename(filename)
  
    # at this point a file name looks something like this: 
    # "db/data/Action Bronson - Larry Csonka - indie.mp3"

    # the line below slices off the db/data/ that prepends each file name
  
    filename.slice!(0..7)

    # now, we need to grab the artist name, song name and genre name out of the filename string

    # right now, the filename looks something like this: "Action Bronson - Larry Csonka - indie.mp3"

    # first, get rid of the '.mp3' file extension:

    filename.slice!(-4..-1)

    # now, split the string on the ' - '

    info = filename.split(" - ")
    
    # our resultant `info` array looks like this: ["Action Bronson", "Larry Csonka", "indie"]
    # we are therefore successfully returning the array of artist, song, genre

 
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