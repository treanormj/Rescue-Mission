class Question < ApplicationRecord
  has_many :answers
  validates :title,
    presence: true,
    length: { minimum: 5 }

  validates :description,
    presence: true,
    uniqueness: true,
    length: { minimum: 10 }
end
