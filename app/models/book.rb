class Book < ApplicationRecord
  belongs_to :author

  def self.only_audio_books
    where("available_as_audiobook=true")
  end

  def self.sort_alphabetically
    order(Arel.sql"lower(name)")
  end

  def self.page_limit(num_of_pages)
    where("page_length >= #{num_of_pages}")
  end
end