describe Song do
  before(:each) do
    Song.reset_all
  end

  let(:song) { Song.new }

  it "can initialize a song" do
    expect(song).to be_a(Song)
  end

  it "can have a name" do
    song.name = "Jump Around"
    expect(song.name).to eq("Jump Around")
  end

  describe "Class methods" do
    it "can reset all songs" do
      Song.reset_all
      expect(Song.count).to eq(0)
    end

    it "keeps track of the songs that have been created" do
      expect(Song.all).to include(song)
    end

    it 'finds a song object by name' do
      song.name = "Find Me"
      expect(Song.find_by_name('Find Me')).to eq(song)
    end

    it 'creates a song object by name' do
      expect(Song.create_by_name('Find Me').name).to eq('Find Me')
      expect(Song.find_by_name('Find Me').name).to eq('Find Me')
    end

    it 'creates a song object by name' do
      expect(Song.create_by_name('Find Me').name).to eq('Find Me')
    end

  end

  describe "with genres" do
    it 'can have genres' do
      song.genre = Genre.new.tap{|a| a.name = "Pop"}
      expect(song.genre).to be_a(Genre)
      expect(song.genre.name).to eq("Pop")
    end

    it 'adding a genre to a song adds that song to a genre' do
      song.genre = Genre.new.tap{|a| a.name = "Techno"}
      expect(song.genre).to eq(Genre.find_by_name("Techno"))
    end

  end

  describe "with artists" do
    it "has an artist" do
      song.artist = Artist.new.tap {|a| a.name = "miley"}
      expect(song.artist).to be_a(Artist)
      expect(song.artist.name).to eq("miley")
    end
  end

  describe "with artists and genres" do

    it 'has a nice to_s format' do
      song.name = "We Can't Stop"
      song.artist = Artist.new.tap {|a| a.name = "Miley Cyrus"}
      song.genre = Genre.new.tap {|g| g.name = "Pop"}
      expect(song.to_s).to eq("Miley Cyrus - We Can't Stop [Pop]")
    end
  end

end
