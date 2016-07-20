class Artist

  extend Concerns::Findable

  attr_accessor :name, :song, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def self.create(name)
    Artist.new(name).tap{|s| s.save}
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    unless self.songs.include?(song)
      @songs << song
    end
  end

  def genres
    @songs.collect do |song|
      song.genre
    end
  end

end
