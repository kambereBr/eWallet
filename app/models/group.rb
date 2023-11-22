class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :operations
  validates :name, :icon, presence: true
  has_one_attached :icon
  validate :validate_icon_presence

  private

  def validate_icon_presence
    errors.add(:icon, 'Please upload an icon') unless icon.attached?
  end
end
