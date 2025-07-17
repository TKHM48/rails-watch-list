class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end

# https://stackoverflow.com/questions/17380794/how-to-forbid-deletion-if-association-present
