class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :number, presence: true
  belongs_to :user
end
