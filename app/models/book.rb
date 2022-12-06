class Book < ApplicationRecord
  belongs_to :author

  def self.only_audio_books
    self.where("available_as_audiobook=true")
  end

  def self.sort_alphabetically
    self.order(Arel.sql"lower(name)")
  end
end