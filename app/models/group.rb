class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :operations
  validates :name, :icon, presence: true
end
