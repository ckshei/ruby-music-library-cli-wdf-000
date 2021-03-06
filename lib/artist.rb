class Artist
extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all 
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    @songs << song unless @songs.include? song
    song.artist = self unless song.artist == self
  end

  def genres
  self.songs.map {|s| s.genre}.uniq
  end

  def to_s
    self.name
  end
end