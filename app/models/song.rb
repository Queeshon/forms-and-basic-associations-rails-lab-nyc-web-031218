class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def note_contents
    ans = self.notes.map do |note|
      note.content
    end
    return ans
  end

  def note_contents=(array)
    array.each do |note|
      if !(note == "")
        self.notes << Note.find_or_create_by(content: note)
      else
      end
    end
  end

end
