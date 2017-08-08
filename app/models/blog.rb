class Blog < ApplicationRecord
  belongs_to :user

  validates :screen_name,
    presence: true,
    length: { minimum: 1 },
    uniqueness: true

  validates :title,
    presence: true,
    length: { minimum: 1 }
end
