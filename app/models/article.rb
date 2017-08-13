class Article < ApplicationRecord
  belongs_to :blog

  validates :title,
    presence: true,
    length: { minimum: 1 }

  validates :body,
    presence: true,
    length: { minimum: 1 }

  scope :recent_created, -> { order("created_at DESC") }
  scope :recent, -> (n){ recent_created.limit(n) }
end
