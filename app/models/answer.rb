class Answer < ApplicationRecord
  belongs_to :question
  validates :description, presence: true, length: { minimum: 10 }
  validates :question_id, presence: true
end
