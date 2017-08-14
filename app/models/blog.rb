class Blog < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy

  validates :screen_name,
    presence: true,
    length: { minimum: 1 },
    uniqueness: true,
    format: { with: /\A[a-zA-Z0-9_-]+\z/ }

  validates :title,
    presence: true,
    length: { minimum: 1 }
end
