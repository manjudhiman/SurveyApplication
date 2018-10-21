class Survey < ApplicationRecord
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true
  validates_presence_of :name
end
