class Article < ApplicationRecord
  belongs_to :blog

  validates :title,
    presence: true,
    length: { minimum: 1 }

  validates :body,
    presence: true,
    length: { minimum: 1 }
end
