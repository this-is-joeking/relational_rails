class Book < ApplicationRecord
  belongs_to :author

  def self.only_audio_books
    self.where("available_as_audiobook=true")
  end
end