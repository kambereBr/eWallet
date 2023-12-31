class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, class_name: 'Group', foreign_key: 'author_id'
  has_many :authored_operations, class_name: 'Operation', foreign_key: 'author_id'
end
