class Bookmark < ApplicationRecord
  belongs_to :movies
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "is alreadyin the list" }
end
