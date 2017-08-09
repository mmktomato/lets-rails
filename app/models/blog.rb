class Blog < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy

  validates :screen_name,
    presence: true,
    length: { minimum: 1 },
    uniqueness: true

  validates :title,
    presence: true,
    length: { minimum: 1 }
end
