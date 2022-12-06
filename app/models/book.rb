class Book < ApplicationRecord
  belongs_to :author

  def self.only_audio_books
    where("available_as_audiobook=true")
  end

  def self.sort_alphabetically
    order(Arel.sql"lower(name)")
  end

  def self.page_limit(num_of_pages)
    num_of_pages = 0 if num_of_pages.empty?

    where("page_length >= #{num_of_pages}")
  end
end