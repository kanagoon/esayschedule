class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  has_many :dones, dependent: :destroy
  has_many :doned_users, through: :dones, source: :user
end