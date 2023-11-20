class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups
  validates :name, :amount, :operation_code, presence: true
end
