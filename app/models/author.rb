class Author < ApplicationRecord
  has_many :books

  def self.sort_by_created_at
    self.order(created_at: :desc)
  end

  def count_books
    self.books.count
  end
end