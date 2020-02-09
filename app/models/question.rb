class Question < ApplicationRecord
  belongs_to :user
  has_many :responses

  validates_presence_of :content
end
