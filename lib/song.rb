require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def name
    @name
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort! { |a_song, b_song| a_song.name <=> b_song.name }
    # sorted_songs = []
    # self.all.each do |song|
    #   sorted_songs << song
    # end
    # sorted_songs.sort! { |a, b| a.name <=> b.name }
  end

    def self.new_from_filename(file)
      song = self.new
      metadata_array = []
      song_array = file.split(/\s(\-)\s|(\.)/)
      song_array.delete_at(1)
      song_array.delete_at(2)
      song_array.pop
      song.name = song_array[1]
      song.artist_name = song_array[0]
      song
    end

    def self.create_from_filename(file)
      song = self.new
      metadata_array = []
      song_array = file.split(/\s(\-)\s|(\.)/)
      song_array.delete_at(1)
      song_array.delete_at(2)
      song_array.pop
      song.name = song_array[1]
      song.artist_name = song_array[0]
      song.save
      song
    end

    def self.destroy_all
      self.all.clear
    end


end
